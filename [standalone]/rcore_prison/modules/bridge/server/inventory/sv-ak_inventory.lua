CreateThread(function()        
    if isResourceLoaded(Inventories.AK47) then
        Inventory.hasItem = function(client, itemName, amount)
            amount = amount or 1
    
            local player = Framework.getPlayer(client)
    
            if not player then
                return false
            end
    
            local itemCount = exports[Bridge.Inventory]:Search(client, 'count', itemName) or 0

            return itemCount and itemCount >= amount or false
        end


        Inventory.clearInventory = function(playerId)
            local identifier = Framework.getIdentifier(playerId)
            local state, error_message = pcall(function()
                return exports[Bridge.Inventory]:ClearInventory(identifier)
            end)
    
            return state
        end

    
        --- @return boolean success
        Inventory.addItem = function(client, item, amount, data)
            local player = Framework.getPlayer(client)

            if player == nil then 
                return false 
            end

            return exports[Bridge.Inventory]:AddItem(client, item, amount, nil, data)
        end

    
        Inventory.removeItem = function(client, item, amount, data)
            local player = Framework.getPlayer(client)

            if player == nil then 
                return false 
            end

            local match = string.match(item, "^WEAPON_(.*)")

            if match then
                item = item:lower()
            end    

            return exports[Bridge.Inventory]:RemoveItem(client, item, amount)
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

        Inventory.registerUsableItem = function(itemName, cb)
            if isBridgeLoaded('Framework', Framework.QBCore) then
                Framework.object.Functions.CreateUseableItem(itemName, function(source, item)
                    cb(source, item.name, item)
                end)
            end
    
            if isBridgeLoaded('Framework', Framework.ESX) then
                Framework.object.RegisterUsableItem(itemName, function(source, item)
                    cb(source, item.name, item)
                end)
            end
        end

        Inventory.getInventoryItems = function(playerId)
            local identifier = Framework.getIdentifier(playerId)
  
            return exports[Bridge.Inventory]:GetInventoryItems(identifier) or {}
        end
    end
end)