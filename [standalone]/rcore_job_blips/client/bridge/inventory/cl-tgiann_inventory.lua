if isBridgeLoaded('Inventory', Inventory.TGIANN)  then
    AddEventHandler('tgiann-inventory:addedItem', function()
        TriggerServerEvent('rcore_job_blips:inventory:checkItem')
    end)

    AddEventHandler('tgiann-inventory:dropItem', function()
        TriggerServerEvent('rcore_job_blips:inventory:checkItem')
    end)
end
