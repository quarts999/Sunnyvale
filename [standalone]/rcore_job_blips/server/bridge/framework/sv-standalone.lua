if isBridgeLoaded('Framework', Framework.Standalone) then
    function Framework.getIdentifier(client)
        return GetPlayerIdentifierByType(client, 'license')
    end

    function Framework.getJob(client)
        return nil
    end

    function Framework.getCharacterName(client)
        return GetPlayerName(client)
    end

    function Framework.getGang(client)
        if not Config.UseRCoreGangs then
            return nil
        end

        return getRCoreGangsGang(client)
    end

    function Framework.sendNotification(client, message, type)
        log.warn('Usage of Framework.sendNotification: Not implemented for standalone mode')
    end

    RegisterNetEvent('rcore_job_blips:standalone:playerActivated', function()
        local client = source
        initializePlayer(client)
    end)
end
