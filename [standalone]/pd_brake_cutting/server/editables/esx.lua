if Config.framework == 'esx' then
    ESX = nil

    TriggerEvent('esx:getSharedObject', function(obj)
        ESX = obj
    end)

    ESX.RegisterUsableItem(Config.toolName, function(source)
        local xPlayer = ESX.GetPlayerFromId(source)

        TriggerClientEvent('pd_brakes:DisableBrakes', source)
    end)

    function UseItem(source)
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.removeInventoryItem(Config.toolName, 1)
    end
end