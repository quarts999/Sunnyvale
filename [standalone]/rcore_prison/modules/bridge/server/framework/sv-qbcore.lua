CreateThread(function()
    if isBridgeLoaded('Framework', Framework.QBCore) then
        local QBCore = nil
    
        local success = pcall(function()
            QBCore = exports[Framework.QBCore]:GetCoreObject()
        end)
    
        if not success then
            success = pcall(function()
                QBCore = exports[Framework.QBCore]:GetSharedObject()
            end)
        end
    
        if not success then
            local breakPoint = 0
            while not QBCore do
                Wait(100)
                TriggerEvent('QBCore:GetObject', function(obj)
                    QBCore = obj
                end)
    
                breakPoint = breakPoint + 1
                if breakPoint == 25 then
                    fprint('Could not load the sharedobject, are you sure it is called \'QBCore:GetObject\'?', Levels.ERROR)
                    break
                end
            end
        end
    
        Framework.object = QBCore

        NetworkService.EventListener('heartbeat', function(eventType, data)
            if not next(data) then
                return
            end
        
            local prisoner = data.prisoner
        
            if not prisoner then
                return
            end

            local playerId = prisoner.source
            local jailTime = prisoner.jail_time
        
            if eventType == HEARTBEAT_EVENTS.PRISONER_NEW then
                local applyState, applyRetval = pcall(function()
                    return Framework.applyJailMetaData(playerId, jailTime)
                end)
            elseif eventType == HEARTBEAT_EVENTS.PRISONER_RELEASED then
                local applyState, applyRetval = pcall(function()
                    return Framework.removeJailMetaData(playerId)
                end)
            end
        end)

        function Framework.getPlayer(client)
            if not client then
                return nil
            end

            return QBCore.Functions.GetPlayer(client)
        end


        function Framework.getPlayerCuffState(client)
            local player = Framework.getPlayer(client)

            if not player then
                return false
            end

            local retval = false
            
            if player.PlayerData.metadata['ishandcuffed'] then
                retval = player.PlayerData.metadata['ishandcuffed']
            end

            return retval
        end

        function Framework.getMoney(client)
            local player = Framework.getPlayer(client)

            if not player then
                return 0
            end

            return player.Functions.GetMoney("cash")
        end


        function Framework.addMoney(client, amount)
            local player = Framework.getPlayer(client)

            if not player then
                return 0
            end

            return player.Functions.AddMoney("cash", amount)
        end

        function Framework.removeMoney(client, amount)
            local player = Framework.getPlayer(client)

            if not player then
                return 0
            end

            player.Functions.RemoveMoney("cash", amount)
        end

        function Framework.canPerformJobCommand(client, commandName)
            local job = Framework.getJob(client)
            
            if job == nil then return false, false end
    
            local jobName = job.name
            local jobGrade = job.grade
            local gradeName = job.gradeName:lower()
            
            if jobName == nil then return false end
            
            if Config.RestrictCommands and Config.RestrictCommands.Enable and commandName and next(Config.RestrictCommands.ListGrades[commandName]) then
                if Config.RestrictCommands.UseGradeNumbers and jobGrade ~= nil then
                    if jobGrade >= Config.RestrictCommands.GradeNumber then
                        return true, true
                    else
                        return false, _U('PERMISSION.NOT_ENOUGH_RANK')
                    end
                else
                    local hasPermission = Config.RestrictCommands.ListGrades[commandName][gradeName]

                    if not hasPermission then
                        return false, _U('PERMISSION.NOT_ENOUGH_RANK')
                    else
                        return true, true
                    end
                end
            else
                dbg.debug('Not using restrict commands, since its disabled!')
            end

            if Config.AllowAdminGroupsUseJailCommands and Framework.isAdmin(client) then
                return true, true
            end
    
            if Config.Jobs[jobName] then
                return true, true
            end
            
            return false, false
        end
    
        function Framework.getCharacterShortName(client)
            local player = Framework.getPlayer(client)
            if player == nil then return nil end
    
            local firstname = player.PlayerData.charinfo.firstname
            local lastname = player.PlayerData.charinfo.lastname
    
            local shortName = firstname or lastname
    
            return shortName
        end
    
        function Framework.getIdentifier(client)
            local player = Framework.getPlayer(client)

            if player == nil then return nil end
    
            return tostring(player.PlayerData.citizenid)
        end
    
        function Framework.getJob(client)
            local player = Framework.getPlayer(client)
            if player == nil then return nil end
    
            return {
                name = player.PlayerData.job.name,
                gradeName = player.PlayerData.job.grade.name,
                grade = player.PlayerData.job.grade.level,
                onDuty = player.PlayerData.job.onduty,
                isBoss = player.PlayerData.job.isboss
            }
        end
    
        function Framework.getCharacterName(client)
            local player = QBCore.Functions.GetPlayer(client)
            if player == nil then return nil end
    
            local firstname = player.PlayerData.charinfo.firstname
            local lastname = player.PlayerData.charinfo.lastname
    
            return string.format('%s %s', firstname, lastname)
        end
    
        function Framework.sendNotification(client, message, type)
            if type == 'info' then
                type = 'primary'
            end

            TriggerClientEvent('QBCore:Notify', tonumber(client), message, type, 5000)
        end
    
        function Framework.isAdmin(client)
            for _, adminGroup in ipairs(Config.FrameworkAdminGroups[Bridge.Framework]) do
                if QBCore.Functions.HasPermission(client, adminGroup) then
                    return true
                end
            end
    
            return false
        end

        function Framework.removeJailMetaData(client)
            local player = Framework.getPlayer(client)

            if not player then
                return nil
            end

            player.Functions.SetMetaData('injail', 0)
            player.Functions.SetMetaData('criminalrecord', {})
        end

        function Framework.applyJailMetaData(client, jailTime)
            local player = Framework.getPlayer(client)

            if not player then
                return nil
            end

            local currentDate = os.date('*t')

            if currentDate.day == 31 then
                currentDate.day = 30
            end
        
            player.Functions.SetMetaData('injail', jailTime)
            player.Functions.SetMetaData('criminalrecord', {
                ['hasRecord'] = true,
                ['date'] = currentDate
            })
        end

        function Framework.getOfficers()
            local players = GetPlayers()
            local officers = {}

            if isResourcePresentProvideless(THIRD_PARTY_RESOURCE.WASABI_POLICE) then
                return exports.wasabi_police:getPoliceOnline()
            else
                for playerId, v in pairs(players) do
                    local job = Framework.getJob(playerId)
    
                    if not job then
                        return
                    end
    
                    local jobName = job.name
    
                    if Config.Jobs[jobName] then
                        officers[#officers + 1] = playerId
                    end
                end
            end
 
            return officers
        end

        function Framework.setJob(client, jobName)
            local player = Framework.getPlayer(client)

            if not player then
                return nil
            end

            if not jobName then
                jobName = 'unemployed'
            end

            player.Functions.SetJob(jobName)

            dbg.debug("Framework.setJob: Setting citizen %s (%s) to job named: %s", GetPlayerName(client), client, jobName)
        end

        --- @return boolean
        function Framework.clearInventory(client)
            local player = Framework.getPlayer(client)

            if player == nil then 
                return nil 
            end
    
            local p = promise.new()
            local clearMain, clearMainErr = pcall(function()
                return player.Functions.ClearInventory(Inventory.KeepSessionItems)
            end)
            
            local state = false
    
            if clearMain then
                state = true
                p:resolve(state)
            else
                local backClear, backClearErr = pcall(player.Functions.SetPlayerData, "items", {})

                if backClear then
                    state = true
                    p:resolve(state)
                else
                    p:resolve(state)
                end
            end

            dbg.debugInventory("Framework.clearInventory: For citizen %s (%s) with state: %s", GetPlayerName(client), client, state)
    
            Citizen.Await(p)
    
            return state
        end

        function Framework.canStartPrisonBreak()
            local retval = false
            local officers = Framework.getOfficers()
        
            if type(officers) == "table" then
                if Config.Escape.PoliceCheck then
                    if officers and next(officers) then
                        local size = #officers
        
                        if not size or size == 0 then
                            size = table.size(officers)
                        end
        
                        if size and size >= Config.Escape.RequiredPolice then
                            retval = true
                        end
                    end
                else
                    retval = true
                end
            elseif type(officers) == "number" then
                if officers >= Config.Escape.RequiredPolice then
                    retval = true
                end
            end
        
            return retval
        end
    
        RegisterNetEvent('QBCore:Server:OnPlayerLoaded', function()
            local client = source
 
            if client then
                local playerJob = Framework.getJob(client)

                if playerJob then
                    SetTimeout(1000, function()
                        TriggerClientEvent('rcore_prison:client:playerLoaded', client, playerJob)
                    end)
                end
            end

            if PrisonService.CheckForAnySentence(client) then
                local mePed = GetPlayerPed(client)
                local meCoords = GetEntityCoords(mePed)

                local prisonYard = vec3(SH.data.prisonYard.x, SH.data.prisonYard.y, SH.data.prisonYard.z)

                local dist = #(prisonYard - meCoords)

                if dist >= 100 then
                    if SH.data.prisonYard then
                        local coords = vec3(SH.data.prisonYard.x, SH.data.prisonYard.y, SH.data.prisonYard.z)
            
                        if coords then
                            StartClient(client, 'teleportUser', coords)
                        end
                    end

                    dbg.debug("Prisoner: Teleporting citizen %s (%s) to prison yard, spawned outside of Prison!", GetPlayerName(client), client)
                end
            end

            TriggerEvent('rcore_prison:server:playerLoaded', client)
        end)
    
        AddEventHandler('QBCore:Server:OnPlayerUnload', function(playerId)
            TriggerEvent('rcore_prison:server:playerUnloaded', playerId)
        end)

        AddEventHandler('playerDropped', function()
            local playerId = source
        
            if playerId then
                TriggerEvent('rcore_prison:server:playerUnloaded', playerId)
            end
        end)

        SetTimeout(2000, function()
            Inventory.CheckItemExistList(PRISON_ITEMS)
        end)
    end    
end, "sv-qbcore code name: Phoenix")