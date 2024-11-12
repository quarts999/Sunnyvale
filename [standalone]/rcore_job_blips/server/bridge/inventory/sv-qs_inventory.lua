if isBridgeLoaded('Inventory', Inventory.QS) then
    Inventory.hasItem = function(client, item)
        return exports['qs-inventory']:GetItemTotalAmount(client, item) > 0
    end

    if isBridgeLoaded('Framework', Framework.QBCore) then
        AddEventHandler('QBCore:Player:SetPlayerData', function(playerData)
            local client = playerData.source
            TriggerEvent('rcore_job_blips:inventory:checkItem', client)
        end)
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
