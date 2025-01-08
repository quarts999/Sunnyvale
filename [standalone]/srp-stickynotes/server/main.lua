-- server/main.lua
local QBCore = exports['qb-core']:GetCoreObject()

-- Register the sticky note item as usable
QBCore.Functions.CreateUseableItem(Config.GPSTracker, function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    
    -- Check if the player has the sticky note item
    if Player.Functions.GetItemByName(Config.GPSTracker) then
        -- Remove 1 sticky note item from the player's inventory
        Player.Functions.RemoveItem(Config.GPSTracker, 1)
        
        -- Trigger client event to reveal the hidden location
        TriggerClientEvent('gpstracker:revealLocation', source)
    else
        TriggerClientEvent('QBCore:Notify', source, 'You do not have a GPS Tracker!', 'error')
    end
end)
