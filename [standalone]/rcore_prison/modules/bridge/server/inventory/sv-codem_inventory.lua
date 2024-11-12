CreateThread(function()
    if isBridgeLoaded('Inventory', Inventories.CODEM) then
        Inventory.hasItem = function(client, itemName, amount)
            amount = amount or 1
    
            local retval = false
            local inventoryItems = Inventory.getInventoryItems(client)

            if inventoryItems and next(inventoryItems) then
                for k, v in pairs(inventoryItems) do
                    local inventoryAmount = v.amount or v.count or 0

                    if v.name == itemName and tonumber(inventoryAmount) >= tonumber(amount) then
                        retval = true
                        break
                    end
                end
            else
                return false
            end
    
            dbg.debugInventory('Inventory.hasItem: %s (%s) - checking if user has %s amount (%s) with state: %s',
                GetPlayerName(client), client, itemName, amount, retval)
    
            return retval
        end
    
        Inventory.addMultipleItems = function(client, items)
            if not client then
                return
            end
    
            if not items then
                return
            end
    
            local p = promise.new()
    
            if next(items) then
                for i = 1, #items, 1 do
                    local item = items[i]
    
                    if item and next(item) then
                        Inventory.addItem(client, item.name, item.count, item.metadata)
                    end
    
                    if i >= #items then
                        p:resolve(true)
                    end
                end
            else
                p:resolve(false)
            end
    
            return Citizen.Await(p)
        end
    
        Inventory.addItem = function(client, item, amount, data)
            local player = Framework.getPlayer(client)
    
            if item == 'cash' or item == 'money' then
                if player == nil then
                    return false
                end
    
                if isBridgeLoaded('Framework', Framework.QBCore) then
                    return player.Functions.AddMoney('cash', amount)
                end
        
                if isBridgeLoaded('Framework', Framework.ESX) then
                    return player.addMoney(amount)
                end
            end

            local match = string.match(item, "^WEAPON_(.*)")

            if match then
                item = item:lower()
            end
    
            local state, error_message = pcall(function()
                return exports[Bridge.Inventory]:AddItem(client, item, amount, nil, data)
            end)
    
            return state
        end
    
        Inventory.removeItem = function(client, item, amount, data)
            local player = Framework.getPlayer(client)
    
            if item == 'cash' or item == 'money' then
                if player == nil then
                    return false
                end
    
                if isBridgeLoaded('Framework', Framework.QBCore) then
                    return player.Functions.RemoveMoney('cash', amount)
                end
        
                if isBridgeLoaded('Framework', Framework.ESX) then
                    return player.removeMoney(amount)
                end
            end

            local match = string.match(item, "^WEAPON_(.*)")

            if match then
                item = item:lower()
            end
            
            local state, error_message = pcall(function()
                return exports[Bridge.Inventory]:RemoveItem(client, item, amount)
            end)
    
            return state
        end
    
        Inventory.registerUsableItem = function(name, cb)
            if isBridgeLoaded('Framework', Framework.ESX) then
                Framework.object.RegisterUsableItem(name, function(source)
                    cb(source, name)
                end)
            elseif isBridgeLoaded('Framework', Framework.QBCore) then
                Framework.object.Functions.CreateUseableItem(name, function(source, item)
                    cb(source, item.name, item)
                end)
            end 
        end
    
        Inventory.getInventoryItems = function(playerId)
            local player = Framework.getPlayer(playerId)
    
            if player == nil then return {} end

            local identifier = Framework.getIdentifier(playerId)

            if not identifier then
                return {}
            end

            return exports[Bridge.Inventory]:GetInventory(identifier, source)
        end
    
    
        Inventory.clearInventory = function(playerId)
            local state, error_message = pcall(function()
                return exports[Bridge.Inventory]:ClearInventory(playerId)
            end)
    
            return state
        end
    end
end)