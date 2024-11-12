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
                log.error('Could not load the sharedobject, are you sure it is called \'QBCore:GetObject\'?')
                break
            end
        end
    end

    Framework.object = QBCore

    function Framework.getIdentifier(client)
        local player = QBCore.Functions.GetPlayer(client)
        if player == nil then return nil end

        return player.PlayerData.citizenid
    end

    function Framework.getJob(client)
        local player = QBCore.Functions.GetPlayer(client)
        if player == nil then return nil end

        return {
            name = player.PlayerData.job.name,
            grade = player.PlayerData.job.grade.level,
        }
    end

    function Framework.getCharacterName(client)
        local player = QBCore.Functions.GetPlayer(client)
        if player == nil then return nil end

        local firstname = player.PlayerData.charinfo.firstname
        local lastname = player.PlayerData.charinfo.lastname
        return string.format('%s %s', firstname, lastname)
    end

    function Framework.getGang(client)
        if Config.UseRCoreGangs then
            return getRCoreGangsGang(client)
        end

        local player = QBCore.Functions.GetPlayer(client)
        if player == nil then return nil end

        return player.PlayerData.gang.name
    end

    function Framework.sendNotification(client, message, type)
        TriggerClientEvent('QBCore:Notify', tonumber(client), message, type, 5000)
    end

    function Framework.getCallsign(identifier)
        local player = QBCore.Functions.GetPlayerByCitizenId(identifier)
        if player == nil then return nil end

        return player.PlayerData.metadata.callsign
    end

    RegisterNetEvent('QBCore:Server:OnPlayerLoaded', function()
        local client = source
        initializePlayer(client)
    end)

    if not isBridgeLoaded('Inventory', Inventory.QB) then
        AddEventHandler('QBCore:Server:OnJobUpdate', function(client)
            initializePlayer(client)
        end)
    end

    RegisterNetEvent('QBCore:Server:OnGangUpdate', function(client)
        initializePlayer(client)
    end)
end
