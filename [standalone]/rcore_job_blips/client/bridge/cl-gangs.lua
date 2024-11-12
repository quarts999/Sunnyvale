RegisterNetEvent('rcore_gangs:client:set_gang')
AddEventHandler('rcore_gangs:client:set_gang', function(gang)
    TriggerServerEvent('rcore_job_blips:players:initialize')
end)
