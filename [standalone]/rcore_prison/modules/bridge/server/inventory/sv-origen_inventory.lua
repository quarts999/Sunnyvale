CreateThread(function()
    if isBridgeLoaded('Inventory', Inventories.ORIGEN) then
        Inventory.hasItem = function(client, itemName, amount)
            local src = source
            amount = amount or 1

            local item = exports[Bridge.Inventory]:GetItemByName(src, itemName)
            local hasItem = exports[Bridge.Inventory]:HasItem(src, itemName, amount)

            if not hasItem then
                dbg.debugInventory("Inventory.hasItem: Item %s doesnt exist!", itemName)
                return false
            end
            
            local ItemInfo = {
                name = itemName,
                count = item.amount or item.count or 0,
                label = item.label or "none",
                weight = item.weight or 0,
                usable = item.useable or false,
                rare = false,
                canRemove = false
            }
    
            dbg.debugInventory('Inventory.hasItem: %s (%s) - checking if user has %s amount (%s) with state: %s',
                GetPlayerName(client), client, itemName, amount, ItemInfo.count >= amount or false)
    
            return ItemInfo and ItemInfo.count >= amount or false
        end
    
        Inventory.getInventoryItems = function(playerId)
            return exports.origen_inventory:GetInventory(playerId)
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
    
            return exports[Bridge.Inventory]:RemoveItem(client, item, amount, nil, true)
        end
    
    
        --- @return boolean success
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
                return exports[Bridge.Inventory]:GiveWeaponToPlayer(client, item:lower(), math.random(30, 120))
            end
    
            return exports[Bridge.Inventory]:AddItem(client, item, amount, nil, data, true)
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
    
        Inventory.clearInventory = function(playerId)
            local state, error_message = pcall(function()
                if Config.Stash.KeepItemsState and Inventory.KeepSessionItems then
                    return exports[Bridge.Inventory]:ClearInventory(playerId, Inventory.KeepSessionItems)
                else
                    return exports[Bridge.Inventory]:ClearInventory(playerId, {})
                end
            end)
 
            if state then
                state = true
            elseif not state and isBridgeLoaded('Framework', Framework.QBCore) then
                state = Framework.clearInventory(playerId)
            end
    
            return state
        end
    
        local inventoryResource = isBridgeLoaded('Framework', Framework.ESX) and Bridge.Inventory or Framework.QBCore
    
        AssetDeployer:registerFileDeploy('items', inventoryResource, 'shared/items.lua',
            function(file, data)
                file = file:strtrim():gsub('}$', '')
                file = append(file, ASSET_DEPLOYER_WATERMARK_PREFIX)
                local itemTemplate = [[
        ['%s'] = {
            ['name'] = '%s',
            ['label'] = '%s',
            ['weight'] = %s,
            ['type'] = '%s',
            ['image'] = '%s.png',
            ['unique'] = %s,
            ['useable'] = %s,
            ['shouldClose'] = %s,
            ['combinable'] = nil,
        },
            ]]
    
                for _, item in ipairs(data) do
                    local formattedItem = itemTemplate:format(
                        item.name,
                        item.name,
                        item.label,
                        item.weight,
                        item.type,
                        item.name,
                        item.unique,
                        item.useable,
                        item.shouldClose
                    )
                    file = appendQB(file, formattedItem)
                end
    
                file = append(file, '', ASSET_DEPLOYER_WATERMARK_SUFFIX, '}')
                return file
            end,
            QB_INVENTORY_ITEMS_DEPLOY
        )
    
        AssetDeployer:registerCopyFilesDeploy('items-images', Bridge.Inventory, 'assets/inventoryImages/png', 'html/images',
            function(data)
                local files = {}
    
                for _, item in ipairs(data) do
                    table.insert(files, item .. '.png')
                end
    
                return files
            end,
            { 'sprunk', 'sludgie', 'ecola_light', 'ecola', 'coffee', 'water', 'fries', 'pizza_ham', 'chips', 'donut',
                'wire_cutter', 'cigarrete' }
        )
    end
end)