if Config.framework == 'qbcore' then
    QBCore = exports['qb-core']:GetCoreObject()

    QBCore.Functions.CreateUseableItem(Config.toolName, function(source)
        TriggerClientEvent('pd_brakes:DisableBrakes', source)
    end)

    function UseItem(source)
        local xPlayer = QBCore.Functions.GetPlayer(source)

        xPlayer.Functions.RemoveItem(Config.toolName, 1)
    end

end