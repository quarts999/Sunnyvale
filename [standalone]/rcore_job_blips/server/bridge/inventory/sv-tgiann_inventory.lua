if isBridgeLoaded('Inventory', Inventory.TGIANN) then
    Inventory.hasItem = function(client, item, amount)
        if amount == nil then
            amount = 1
        end

        return exports[Inventory.TGIANN]:HasItem(client, item, amount)
    end

    if isBridgeLoaded('Framework', Framework.ESX) then
        AddEventHandler('esx:onAddInventoryItem', function(client, item, count)
            TriggerEvent('rcore_job_blips:inventory:checkItem', client)
        end)

        AddEventHandler('esx:removeInventoryItem', function(client, item, count)
            TriggerEvent('rcore_job_blips:inventory:checkItem', client)
        end)
    end
end
