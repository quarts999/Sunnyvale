QBCore = exports['qb-core']:GetCoreObject()

-- Weed Lab Key
RegisterNetEvent('srp-druglabs:server:RemoveLabKey')
AddEventHandler('srp-druglabs:server:RemoveLabKey', function()
    local src = source -- Get the source player ID
    local Player = QBCore.Functions.GetPlayer(src) -- Get the player object

    if Player then
        -- Remove the labkey item from the player's inventory
        Player.Functions.RemoveItem(Shared.LabkeyItem, 1)
        TriggerClientEvent('ps-inventory:client:ItemBox', src, QBCore.Shared.Items['weedkey'], 'remove')
        TriggerClientEvent('QBCore:Notify', src, "Keycard removed from your inventory", 'success')
    end
end)

-- Cocaine Lab Key
RegisterNetEvent('srp-druglabs:server:RemoveLabKey2')
AddEventHandler('srp-druglabs:server:RemoveLabKey2', function()
    local src = source -- Get the source player ID
    local Player = QBCore.Functions.GetPlayer(src) -- Get the player object

    if Player then
        -- Remove the labkey item from the player's inventory
        Player.Functions.RemoveItem(Shared.LabkeyItem2, 1)
        TriggerClientEvent('ps-inventory:client:ItemBox', src, QBCore.Shared.Items['cocainekey'], 'remove')
        TriggerClientEvent('QBCore:Notify', src, "Keycard removed from your inventory", 'success')
    end
end)

-- Meth Lab Key
RegisterNetEvent('srp-druglabs:server:RemoveLabKey3')
AddEventHandler('srp-druglabs:server:RemoveLabKey3', function()
    local src = source -- Get the source player ID
    local Player = QBCore.Functions.GetPlayer(src) -- Get the player object

    if Player then
        -- Remove the labkey item from the player's inventory
        Player.Functions.RemoveItem(Shared.LabkeyItem3, 1)
        TriggerClientEvent('ps-inventory:client:ItemBox', src, QBCore.Shared.Items['methkey'], 'remove')
        TriggerClientEvent('QBCore:Notify', src, "Keycard removed from your inventory", 'success')
    end
end)