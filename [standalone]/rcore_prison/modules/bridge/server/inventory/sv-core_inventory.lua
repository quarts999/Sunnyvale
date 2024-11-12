CreateThread(function()
    if isBridgeLoaded('Inventory', Inventories.CORE) then
        Inventory.hasItem = function(client, itemname, amount)
            if client == nil then return {} end
    
            local player = Framework.getPlayer(client)
    
            amount = amount or 1
    
            if isBridgeLoaded('Framework', Framework.ESX) then
                local item = player.getInventoryItem(itemname)
                return item and item.count >= amount
            elseif isBridgeLoaded('Framework', Framework.QBCore) then
                local items = player.Functions.GetItemsByName(itemname)
                return items and #items >= amount
            end
    
            return false
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
    
            if player == nil then
                return false
            end
    
            if item == 'cash' or item == 'money' then
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

            if isBridgeLoaded('Framework', Framework.ESX) then
                player.addInventoryItem(item, amount, data)
            elseif isBridgeLoaded('Framework', Framework.QBCore) then
                player.Functions.AddItem(item, amount, nil, data)
            end
    
            return true
        end
    
        Inventory.removeItem = function(playerId, item, amount, data)
            local player = Framework.getPlayer(playerId)
    
            if player == nil then
                return false
            end
    
            if item == 'cash' or item == 'money' then
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
    
            if isBridgeLoaded('Framework', Framework.ESX) then
                player.removeInventoryItem(item, amount)
            elseif isBridgeLoaded('Framework', Framework.QBCore) then
                player.Functions.RemoveItem(item, amount, nil)
            end
    
            return true
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

            local inventory = {}
            local content = {}
            local primary = {}

            if Bridge.Framework == Framework.ESX then
                content = exports[Bridge.Inventory]:getInventory('content-' .. player.getIdentifier():gsub(':',''))
                primary = exports[Bridge.Inventory]:getInventory('primary-' .. player.getIdentifier():gsub(':',''))

                inventory = table.merge(content, primary)
            else
                content = exports[Bridge.Inventory]:getInventory('content-' .. player.PlayerData.citizenid)
                primary = exports[Bridge.Inventory]:getInventory('primary-' .. player.PlayerData.citizenid)

                inventory = table.merge(content, primary)
            end
            
            return inventory or {}
        end

    
        Inventory.clearInventory = function(playerId)
            local player = Framework.getPlayer(playerId)

            if not player then
                return false
            end

            local state, error_message = pcall(function()
                if Config.Stash.KeepItems and Inventory.KeepSessionItems and #Inventory.KeepSessionItems > 0 then
                    dbg.debugInventory('Clear inventory with stash items is not supported, clearing all items and stashing them into prisn stash: for player named %s (%s)', playerId, GetPlayerName)
                    
                    if Bridge.Framework == Framework.ESX then
                        exports[Bridge.Inventory]:clearInventory('content-' .. player.getIdentifier():gsub(':',''))
                        exports[Bridge.Inventory]:clearInventory('primary-' .. player.getIdentifier():gsub(':',''))
                        exports[Bridge.Inventory]:clearInventory('secondry-' .. player.getIdentifier():gsub(':',''))
                    else
                        exports[Bridge.Inventory]:clearInventory('content-' .. player.PlayerData.citizenid)
                        exports[Bridge.Inventory]:clearInventory('primary-' .. player.PlayerData.citizenid)
                        exports[Bridge.Inventory]:clearInventory('secondry-' .. player.PlayerData.citizenid)
                    end

                    return true
                else
                    if Bridge.Framework == Framework.ESX then
                        exports[Bridge.Inventory]:clearInventory('content-' .. player.getIdentifier():gsub(':',''))
                        exports[Bridge.Inventory]:clearInventory('primary-' .. player.getIdentifier():gsub(':',''))
                        exports[Bridge.Inventory]:clearInventory('secondry-' .. player.getIdentifier():gsub(':',''))
                    else
                        exports[Bridge.Inventory]:clearInventory('content-' .. player.PlayerData.citizenid)
                        exports[Bridge.Inventory]:clearInventory('primary-' .. player.PlayerData.citizenid)
                        exports[Bridge.Inventory]:clearInventory('secondry-' .. player.PlayerData.citizenid)
                    end

                    return true
                end
            end)

            return true
        end
    end    
end)