if isBridgeLoaded('Inventory', Inventory.MF) then
    if not isBridgeLoaded('Framework', Framework.ESX) then
        log.error('Inventory MF bridge requires Framework ESX to be loaded.')
        return
    end

    Inventory.hasItem = function(client, item, amount)
        if amount == nil then
            amount = 1
        end

        local identifier = Framework.getIdentifier(client)
        local item = exports[Inventory.MF]:getInventoryItem(identifier, item)

        return item and item.count >= amount
    end

    AddEventHandler('esx:onAddInventoryItem', function(client, item, count)
        TriggerEvent('rcore_job_blips:inventory:checkItem', client)
    end)

    AddEventHandler('esx:removeInventoryItem', function(client, item, count)
        TriggerEvent('rcore_job_blips:inventory:checkItem', client)
    end)
end
