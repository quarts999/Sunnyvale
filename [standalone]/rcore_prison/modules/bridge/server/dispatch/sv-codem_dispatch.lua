CreateThread(function()
    if (isBridgeLoaded('Dispatch', DispatchList.CODEM)) or isResourceLoaded('codem-dispatch') then
        Dispatch.Breakout = function(playerId)
            local text = _U('DISPATCH.BREAKOUT_ACTIVE_MESSAGE')
            local dispatchData = {
                type = 'Prison break',
                header = 'Prison break',
                text = text,
                code = '10-64',
            }
    
            TriggerClientEvent('rcore_prison:client:setDispatch', playerId, dispatchData)
            dbg.info('Dispatch.Breakout: Prison break started!')
        end
    end
end)
