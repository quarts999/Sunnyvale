if isBridgeLoaded('Inventory', Inventory.QB) and isBridgeLoaded('Framework', Framework.QBCore) then
    AddEventHandler('inventory:client:UpdatePlayerInventory', function()
        TriggerServerEvent('rcore_job_blips:inventory:checkItem')
    end)
end
