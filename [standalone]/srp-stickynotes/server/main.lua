-- server/main.lua
local QBCore = exports['qb-core']:GetCoreObject()

-- Register the sticky note item as usable
QBCore.Functions.CreateUseableItem(Config.GPSTrackerItem, function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    
    -- Check if the player has the sticky note item
    if Player.Functions.GetItemByName(Config.GPSTrackerItem) then
        -- Remove 1 sticky note item from the player's inventory
        Player.Functions.RemoveItem(Config.GPSTrackerItem, 1)
        
        -- Trigger client event to reveal the hidden location
        TriggerClientEvent('gpstracker:revealLocation', source)
    else
        TriggerClientEvent('QBCore:Notify', source, 'You do not have a sticky note!', 'error')
    end
end)

-- Optional: Giving a sticky note to a player (admin command or other logic)
RegisterCommand('givegpstracker', function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        Player.Functions.AddItem(Config.GPSTrackerItem, 1)
        TriggerClientEvent('QBCore:Notify', source, 'You have received a sticky note!', 'success')
    end
end, false)
