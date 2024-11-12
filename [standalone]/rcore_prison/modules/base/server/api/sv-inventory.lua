Inventory.CreatePrisonerStash = function(playerId, charId)
    if not playerId then
        dbg.critical("Cannot create prisoner stash - no playerId")
        return
    end

    if not charId then
        dbg.critical("Cannot create prisoner stash - no charId")
        return
    end
        
    local success, result = pcall(function()
        local stash = db.CreateStashForPrisoner(charId)
    
        if stash then
            Inventory.SaveAndTakePrisonerItems(playerId, charId)        
        end
    end)

    if not success then 
        dbg.critical("ERROR: Failed to create prisoner stash, seems like issue with your database - create support ticket on our RCore discord")
    end
end

Inventory.DoesItemExist = function(itemName, playerId)
    if not itemName then
        return false
    end

    local isValidItem = false
    local error_message = nil

    dbg.debug('Init >> DoesItemExist: Checking if item named [%s] exists in inventory system: %s', itemName, Bridge.Inventory)

    if Bridge.Inventory == Inventories.OX then
        local retval, state = pcall(function()
            local itemList = exports[Bridge.Inventory]:Items(itemName)

            dbg.debug('OX check >> DoesItemExist: Checking ox_inventory item named [%s] registered item state: %s', itemName, itemList and 'REGISTERED' or 'NOT_REGISTERED')

            if itemList then
                return true
            else
                local success, result = pcall(function()
                    local ItemList = exports[Bridge.Inventory]:ItemList()

                    if ItemList and ItemList[itemName] then
                        return true
                    end
                end)

                if not success then
                    return false
                end

                return true
            end
        end)

        isValidItem = state
        error_message = error_message
    elseif Bridge.Inventory == Inventories.CODEM then
        local retval, state = pcall(function()
            local match = string.match(itemName, "^WEAPON_(.*)")
            
            if match then
                return true
            end

            local itemList = exports[Bridge.Inventory]:GetItemList()

            if itemList and itemList[itemName] then
                return true
            else
                return false
            end
        end)

        isValidItem = state
        error_message = error_message
    elseif Bridge.Framework == Framework.ESX then
        if Bridge.Inventory == Inventories.QS then
            local retval, state = pcall(function()
                local itemList = LoadScriptData('shared/items', Inventories.QS, 'ItemList')

                if itemList and itemList[itemName] then
                    return true
                end
            end)

            isValidItem = state
            error_message = error_message
        else
            isValidItem = true
            error_message = 'OK'
        end
    elseif Bridge.Framework == Framework.QBCore then
        if Bridge.Inventory == Inventories.QS then
            local retval, state = pcall(function()
                local itemList = LoadScriptData('shared/items', Inventories.QS, 'ItemList')

                if itemList and itemList[itemName] then
                    return true
                end
            end)

            isValidItem = state
            error_message = error_message
        else
            local retval, state = pcall(function()
                local match = string.match(itemName, "^WEAPON_(.*)")
        
                if match then
                    return true
                end

                if Framework.object and Framework.object.Shared.Items and Framework.object.Shared.Items[itemName] then
                    return true
                else
                    return false
                end
            end)

            isValidItem = state
            error_message = error_message
        end
    end

    -- If customer is running without inventory system, we can't check if item exists

    if resourceList['Inventory'] == nil and Bridge.Inventory == Inventories.NONE then
        dbg.debug('Inventory system is not loaded - cannot check if item exists, skipping validation.')
        return true, 'OK'
    end

    if playerId then
        dbg.debug('DoesItemExist: Item [%s] registered item state: %s | Error: %s -> request by citizen: %s (%s)', itemName, not isValidItem and 'NOT_REGISTERED' or 'REGISTERED', error_message, GetPlayerName(playerId), playerId)
    end

    if Bridge.Framework == Framework.ESX and (Bridge.Inventory == Inventories.ESX or Bridge.Inventory == Inventories.CORE or Bridge.Inventory == Inventories.CHEEZA) then
        local retval, state = pcall(function()
            local itemList = Framework.object and Framework.object.Items and Framework.object.Items

            if itemList and not next(itemList) then
                dbg.debug('Failed to find any cached items in ESX.Items from - items not proparly cached running inventory named (%s) with Framework (%s), skipping check', Bridge.Inventory, Bridge.Framework)

                if not isValidItem then
                    isValidItem, error_message = true, 'OK'
                end
            end
        end)
    end

    if Bridge.Inventory == Inventories.QS then
        if not isValidItem then
            isValidItem, error_message = true, 'OK'
        end
    end

    return isValidItem, error_message
end

Inventory.GatherInventoryData = function(playerId)
    dbg.debugInventory("GatherInventoryData: Loading for player %s (%s)", GetPlayerName(playerId), playerId)
    
    local success, inventoryData = pcall(function()
        return Inventory.getInventoryItems(playerId)
    end)

    local inventory, statusCode = {}, INVENTORY_STATUS_CODES.EMPTY_INVENTORY
    local p = promise.new()
    local iterCount = 0
    local id = 0
    
    if not inventoryData or not success then
        dbg.debugInventory('Failed to gather player inventory data for user : %s', GetPlayerName(playerId))
        return inventory, statusCode
    end

    if inventoryData and next(inventoryData) then
        for k, item in pairs(inventoryData) do
            iterCount = iterCount + 1
            id = id + 1

            if item then
                inventory[id] = {
                    name = item and item.name or 'UNK-NAME',
                    label = item and item.label or item.name or 'UNK-LABEL',
                    count = item and item.count or item.amount or 0,
                    metadata = item.metadata or item.info or {}
                }
            end

            if iterCount >= table.size(inventoryData) then
                p:resolve(true)
                statusCode = INVENTORY_STATUS_CODES.HAS_ITEMS
            end
        end
    else
        p:resolve(true)
    end

    Citizen.Await(p)

    dbg.debugInventory("GatherInventoryData: Loaded inventory data for player %s (%s) with status: %s", GetPlayerName(playerId), playerId, statusCode)

    return inventory, statusCode
end

Inventory.ClearPlayerInventory = function(playerId)
    if not playerId then
        return
    end

    local retval = false

    if Bridge.Inventory == Inventories.OX then
        retval = Inventory.clearInventory(playerId)
    end
    
    if Bridge.Inventory == Inventories.CODEM then
        retval = Inventory.clearInventory(playerId)
    end

    if Bridge.Inventory == Inventories.AK47 then
        retval = Inventory.clearInventory(playerId)
    end

    if Bridge.Inventory == Inventories.QS then
        retval = Inventory.clearInventory(playerId)
    end

    if Bridge.Inventory == Inventories.CHEEZA then
        retval = Inventory.clearInventory(playerId)
    end

    if Bridge.Inventory == Inventories.CORE then
        retval = Framework.clearInventory(playerId)
    end
    
    if Bridge.Inventory == Inventories.NONE then
        retval = Framework.clearInventory(playerId)
    end

    if not retval then
        retval = Framework.clearInventory(playerId)
    end

    dbg.debugInventory('ClearPlayerInevntory: State %s inventory for user %s! | FW: %s', retval and 'CLEARED' or 'NOT_CLEARED', GetPlayerName(playerId), Bridge.Framework)

    return retval
end

Inventory.HandleOpenState = function(playerId, state)
    dbg.debug('Inventory handle open for user named: %s with state %s', GetPlayerName(playerId), state)

    if not playerId then
        return false
    end

    local ply = Player(playerId)

    if not ply then
        return false
    end

    StartClient(playerId, 'HandleInvBusy', state)

    if isResourcePresentProvideless(Inventories.OX) then
        ply.state:set('invBusy', state, true)
    elseif Bridge.Framework == Framework.QBCore then
        ply.state:set('inv_busy', state, true)
    end

    return true
end

Inventory.SaveVirtualMoney = function(playerId, charId)
end


Inventory.ReturnVirtualMoney = function(playerId, charId)

end

Inventory.GetStashedVirtualMoney = function(charId)
    if not charId then
        return 0
    end

    local kvpKey = ('%s_%s_%s'):format(GetCurrentResourceName(), charId, 'money')

    return tonumber(GetResourceKvpFloat(kvpKey)) or 0
end

Inventory.CheckItemExistList = function(list)
    if not list then
        return false
    end

    if type(list) ~= 'table' then
        return false
    end

    local p = promise.new()
    local checkedItems = {}
    
    if list then
        for itemName, _ in pairs(list) do
            if itemName ~= nil then
                local isValidItem, error_message = Inventory.DoesItemExist(itemName)

                if not isValidItem then
                    checkedItems[itemName] = 'NOT_REGISTERED'
                end
            end
        end
    
        p:resolve(true)
    end

    if checkedItems and next(checkedItems) then
        dbg.bridge('These items are not registered in your inventory system: %s', Bridge.Inventory)
        tprint(checkedItems)
    else
        dbg.bridge('All items are registered in your inventory system: %s', Bridge.Inventory)
    end
    
    return Citizen.Await(p)
end

Inventory.SaveAndTakePrisonerItems = function(playerId, charId)
    if not Config.Stash.EnableStashing then
        return
    end 


    dbg.debugInventory("SaveAndTakePrisonerItems: Loading for player %s (%s) and with charId %s", GetPlayerName(playerId), playerId, charId)

    local inventoryState = Bridge.Inventory
    local playerInventory, statusCode = Inventory.GatherInventoryData(playerId)
    local p = promise.new()

    local virtualMoneyState, virtualMoneyRetval = pcall(function()
        return Inventory.SaveVirtualMoney(playerId, charId)
    end)

    if inventoryState ~= nil then
        dbg.debugInventory("SaveAndTakePrisonerItems: Status: %s for %s (%s)", statusCode, GetPlayerName(playerId), playerId)

        if statusCode == INVENTORY_STATUS_CODES.HAS_ITEMS then
            local clearInventoryState, clearInventoryRetval = pcall(function()
                return Inventory.ClearPlayerInventory(playerId)
            end)

            if clearInventoryState then
                if Config.Stash.KeepItemsState and playerInventory then
                    local size = #playerInventory

                    if size <= 0 then
                        size = table.size(playerInventory)
                    end

                    for i = 1, size, 1 do
                        local itemName = playerInventory[i].name

                        if Bridge.Inventory ~= Inventories.ESX and Inventory.KeepSessionItemsWithName[itemName] then
                            if useCashAsItem and isResourceLoaded(Inventories.QS) and itemName == cashItem then

                            else
                                playerInventory[i] = {}
                            end
                        end

                        if i >= size then
                            p:resolve(true)
                            break
                        end
                    end

                    Citizen.Await(p)

                    db.SavePrisonerItems(playerInventory, charId)
                else
                    db.SavePrisonerItems(playerInventory, charId)
                end
            else
                dbg.debugInventory("SaveAndTakePrisonerItems: Failed to clear inventory for %s (%s) since error: [%s]", GetPlayerName(playerId), playerId, clearInventoryRetval)
            end
        end
    else
        dbg.debugInventory("SaveAndTakePrisonerItems: Inventory is not detected - skipping saving and taking prisoner items")
    end
end
