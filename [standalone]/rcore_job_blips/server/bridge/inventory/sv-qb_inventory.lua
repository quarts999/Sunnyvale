if isBridgeLoaded('Inventory', Inventory.QB) and isBridgeLoaded('Framework', Framework.QBCore) or isBridgeLoaded('Inventory', Inventory.LJ) or isBridgeLoaded('Inventory', Inventory.PS) then
    Inventory.hasItem = function(client, item)
        return Framework.object.Functions.HasItem(client, item)
    end

    AddEventHandler('QBCore:Player:SetPlayerData', function(playerData)
        local client = playerData.source
        TriggerEvent('rcore_job_blips:inventory:checkItem', client)
    end)
end
