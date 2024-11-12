if isBridgeLoaded('Framework', Framework.Standalone) then
    Citizen.CreateThread(function()
        while true do
            if NetworkIsPlayerActive(PlayerId()) then
                Citizen.Wait(500)
                TriggerServerEvent('rcore_job_blips:standalone:playerActivated')
                break
            end
            Citizen.Wait(0)
        end
    end)
end
