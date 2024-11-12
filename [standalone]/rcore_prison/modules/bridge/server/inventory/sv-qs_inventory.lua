function ExtractCashConfig(data)
    if not data then
        return nil, nil
    end

    local useCashAsItem = data:match("UseCashAsItem%s*=%s*(%a+)")

    if useCashAsItem == "true" then
        useCashAsItem = true
    elseif useCashAsItem == "false" then
        useCashAsItem = false
    else
        useCashAsItem = nil
    end
    
    -- Extract the CashItem value
    local cashItem = data:match("CashItem%s*=%s*'([^']+)'")
    
    return useCashAsItem, cashItem
end
    
useCashAsItem, cashItem = nil, nil

CreateThread(function()
    if isBridgeLoaded('Inventory', Inventories.QS) then
        Inventory.hasItem = function(client, itemName, amount)
            amount = amount or 1
    
            local itemCount = exports[Bridge.Inventory]:GetItemTotalAmount(source, itemName)
    
            dbg.debugInventory('Inventory.hasItem: %s (%s) - checking if user has %s amount (%s) with state: %s',
                GetPlayerName(client), client, itemName, amount, itemCount >= amount or false)
    
            return itemCount and itemCount >= amount or false
        end
        
        Inventory.getInventoryItems = function(playerId)
            local player = Framework.getPlayer(playerId)
            local inventory = {}

            if not player then
                return inventory
            end

            if isBridgeLoaded('Framework', Framework.QBCore) then
                inventory = player.PlayerData.items
            end

            if isBridgeLoaded('Framework', Framework.ESX) then
                inventory = player.inventory
            end

            if not next(inventory) then
                inventory = exports[Bridge.Inventory]:GetPlayerInventory(playerId)
            end

            return inventory
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
    
    
        --- @return boolean success
        Inventory.addItem = function(client, item, amount, data)
            local match = string.match(item, "^WEAPON_(.*)")
    
            if match then
                item = item:lower()
            end
    
            return exports[Bridge.Inventory]:AddItem(client, item, amount, nil, data)
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
    
        Inventory.removeItem = function(client, item, amount, data)
            local player = Framework.getPlayer(client)
    
            if useCashAsItem and cashItem then
                if player == nil then
                    return false
                end
    
                if isBridgeLoaded('Framework', Framework.QBCore) then
                    player.Functions.RemoveMoney('cash', amount)
                end

                if isBridgeLoaded('Framework', Framework.ESX) then
                    player.removeMoney(amount)
                end
            else
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
            end

            local match = string.match(item, "^WEAPON_(.*)")
    
            if match then
                item = item:lower()
            end
    
            return exports[Bridge.Inventory]:RemoveItem(client, item, amount, nil, data)
        end
    
        Inventory.clearInventory = function(playerId)
            local success, error_message = pcall(function()
                if Config.Stash.KeepItemsState and Inventory.KeepSessionItems then
                    if useCashAsItem and cashItem then
                        local player = Framework.getPlayer(playerId)
    
                        if player == nil then
                            return false
                        end
    
                        if isBridgeLoaded('Framework', Framework.QBCore) then
                            player.Functions.RemoveMoney('cash', player.Functions.GetMoney('cash'))
                        end

                        if isBridgeLoaded('Framework', Framework.ESX) then
                            player.removeMoney(player.getMoney())
                        end
                    end

                    return exports[Bridge.Inventory]:ClearInventory(playerId, Inventory.KeepSessionItems)
                else
                    return exports[Bridge.Inventory]:ClearInventory(playerId, {})
                end
            end)
    
            local state = false
    
            if success then
                state = true
            elseif isBridgeLoaded('Framework', Framework.QBCore) then
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

        local inventoryData = LoadScriptData('server/custom/framework/qb', Inventories.QS)

        useCashAsItem, cashItem = ExtractCashConfig(inventoryData)
    end    
end)