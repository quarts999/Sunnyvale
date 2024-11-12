function getRCoreGangsGang(client)
    local success, gang = pcall(function()
        return exports.rcore_gangs:GetPlayerGang(client)
    end)
    if not success then
        log.error('You don\'t have rcore_gangs installed, but you have set UseRCoreGangs to true in config.lua')
        return nil
    end

    if gang == nil then
        return nil
    end

    return gang.id
end
