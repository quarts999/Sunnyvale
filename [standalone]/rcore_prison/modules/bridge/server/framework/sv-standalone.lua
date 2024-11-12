CreateThread(function()
    if isBridgeLoaded('Framework', Framework.Standalone) then
        function Framework.getIdentifier(client)
            local license = GetPlayerIdentifierByType(client, 'license')
    
            return license
        end
    
        function Framework.getJob(client)
            local retval =  {
                name = 'unemployed',
                label = 'Unemployed',
                gradeName = 'None',
                grade = 1
            }

            if Ace.Can(client, Permissions.CAN_USE_JOB_COMMANDS) then
                retval =  {
                    name = 'police',
                    label = 'Police',
                    gradeName = 'Officer',
                    grade = 1
                }
            end
    
            return retval
        end
    
                    
        function Framework.getPlayer(client)
            return nil
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
            end

            if Config.AllowAdminGroupsUseJailCommands and Framework.isAdmin(client) then
                return true, true
            end
    
            if Config.Jobs[jobName] then
                return true, true
            end
            
            return false, false
        end
    
        function Framework.getCharacterName(client)
            return GetPlayerName(client)
        end

        function Framework.isAdmin(client)
            local retval = false

            if Ace.Can(client, Permissions.HAS_SERVER_GROUP) then
                retval = true
            end
    
            return retval
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
    
        function Framework.getOfficers()
            local players = GetPlayers()
            local officers = {}
 
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

            return officers
        end
    
        function Framework.setJob(client, jobName)
            dbg.debug('This feature is not defined for Standalone, will not work!')
        end
    
        RegisterNetEvent('rcore_prison:bridge:standalonePlayerActivated', function()
            local client = source
            TriggerEvent('rcore_prison:server:playerLoaded', client)
        end)
    
        AddEventHandler('playerDropped', function()
            local playerId = source
        
            if playerId then
                TriggerEvent('rcore_prison:server:playerUnloaded', playerId)
            end
        end)
    end    
end, "sv-standalone code name: Phoenix")