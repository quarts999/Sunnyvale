CreateThread(function()
    if (isBridgeLoaded('Dispatch', DispatchList.NONE or isBridgeLoaded('Dispatch', DispatchList.NATIVE))) then
        Dispatch.Breakout = function(playerId)
            local retval = Framework.getOfficers()
            local text = _U('DISPATCH.BREAKOUT_ACTIVE_MESSAGE')
            local coords = vec3(SH.data.prisonYard.x, SH.data.prisonYard.y, SH.data.prisonYard.z)
    
            if retval and next(retval) then
                for _, playerId in pairs(retval) do
                    if playerId then
                        Framework.sendNotification(playerId, _U('DISPATCH.BREAKOUT_ACTIVE_MESSAGE'), 'info') 
                    end
                end
            end

            if isResourceLoaded(THIRD_PARTY_RESOURCE.REDUTZU) then
                TriggerEvent('redutzu-mdt:server:addDispatchToMDT', {
                    code = '10-64',
                    title = text,
                    duration = 12 * 1000,
                    coords = { x = coords.x, y = coords.y, z = coords.z },
                })
            end

            dbg.info('Dispatch.Breakout: This will be shown to all players, adjust it to your needs.')
        end
    end
end, "sv-standalone code name: Phoenix")
