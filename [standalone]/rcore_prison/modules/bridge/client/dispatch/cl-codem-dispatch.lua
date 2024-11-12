CreateThread(function()
    if (isBridgeLoaded('Dispatch', DispatchList.CODEM)) or isResourceLoaded('codem-dispatch') then
        RegisterNetEvent('rcore_prison:client:setDispatch', function(payload)
            if not payload then
                return
            end

            exports['codem-dispatch']:CustomDispatch(payload)
        end)
    end
end)



