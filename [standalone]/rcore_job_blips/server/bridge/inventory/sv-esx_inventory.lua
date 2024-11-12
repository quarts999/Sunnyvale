if isBridgeLoaded('Inventory', Inventory.ESX) or isBridgeLoaded('Inventory', Inventory.CHEZZA) or (isBridgeLoaded('Inventory', Inventory.QS) and isBridgeLoaded('Framework', Framework.ESX)) then
    if not isBridgeLoaded('Framework', Framework.ESX) then
        log.error(
            'ESX inventory is selected but ESX is not the framework resource. Please change the framework resource or the inventory type.'
        )
        return
    end

    Inventory.hasItem = function(client, item)
        local player = Framework.object.GetPlayerFromId(client)
        if player == nil then return false end

        return player.hasItem(item)
    end

    AddEventHandler('esx:onAddInventoryItem', function(client, item, count)
        TriggerEvent('rcore_job_blips:inventory:checkItem', client)
    end)

    AddEventHandler('esx:removeInventoryItem', function(client, item, count)
        TriggerEvent('rcore_job_blips:inventory:checkItem', client)
    end)
end
