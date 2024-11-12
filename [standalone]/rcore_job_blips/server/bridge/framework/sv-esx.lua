if isBridgeLoaded('Framework', Framework.ESX) then
    local ESX = nil

    local success, result = pcall(function()
        ESX = exports[Framework.ESX]:getSharedObject()
    end)

    if not success then
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end

    Framework.object = ESX

    local debugIdentifiers = {}
    function Framework.getIdentifier(client)
        local player = ESX.GetPlayerFromId(client)
        if player == nil then return nil end

        if fakeIdentifiers then
            if debugIdentifiers[tostring(client)] == nil then
                debugIdentifiers[tostring(client)] = table.size(debugIdentifiers) + 1
            end

            log.debug('Returning fake identifier %s for player id %s', debugIdentifiers[tostring(client)],
                client)
            return debugIdentifiers[tostring(client)]
        end

        return player.identifier
    end

    function Framework.getJob(client)
        local player = ESX.GetPlayerFromId(client)
        if player == nil then return nil end

        return {
            name = player.job.name,
            grade = player.job.grade_name,
        }
    end

    function Framework.getCharacterName(client)
        local player = ESX.GetPlayerFromId(client)
        if player == nil then return nil end

        local firstname = player.get('firstName')
        local lastname = player.get('lastName')
        if firstname == nil or lastname == nil then
            firstname = player.firstname
            lastname = player.lastname
        end

        return string.format('%s %s', firstname, lastname)
    end

    function Framework.getGang(client)
        if not Config.UseRCoreGangs then
            return nil
        end

        return getRCoreGangsGang(client)
    end

    function Framework.sendNotification(client, message, type)
        local player = ESX.GetPlayerFromId(client)
        if player == nil then return end

        player.showNotification(message, type)
    end

    AddEventHandler('esx:playerLoaded', function(client, player)
        if isBridgeLoaded('Inventory', Inventory.OX) then
            Citizen.Wait(2000)
        end

        initializePlayer(client)
    end)

    AddEventHandler('esx:setJob', function(client)
        initializePlayer(client)
    end)

    AddEventHandler('esx:playerDropped', function(client)
        destroyPlayer(client)
    end)
end
