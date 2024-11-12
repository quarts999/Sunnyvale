if isBridgeLoaded('Duty', Duty.QBCore) then
    if not isBridgeLoaded('Framework', Framework.QBCore) then
        log.error('Duty bridge requires Framework QBCore!')
        return
    end

    Duty.isPlayerInService = function(playerId)
        local object = Framework.object
        if object == nil then
            log.error('Framework object is nil while checking qb duty.')
            return false
        end


        local player = object.Functions.GetPlayer(playerId)
        if player == nil then
            log.error('Player %s is nil while checking qb duty.', playerId)
            return false
        end

        return player.PlayerData.job.onduty
    end
end
