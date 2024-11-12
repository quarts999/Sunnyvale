if isBridgeLoaded('Inventory', Inventory.OX) then
    Inventory.hasItem = function(client, item, amount)
        if amount == nil then
            amount = 1
        end

        local item = exports[Inventory.OX]:GetItemCount(client, item)
        return item and item >= amount
    end

    exports[Inventory.OX]:registerHook('swapItems', function(payload)
        if payload.fromInventory ~= payload.toInventory then
            SetTimeout(1000, function()
                log.debug('[OX] Checking item %s for player %s', payload.source, payload.source)
                TriggerEvent('rcore_job_blips:inventory:checkItem', payload.source)
            end)
        end

        return true
    end)
end
