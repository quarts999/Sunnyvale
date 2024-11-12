function ReceiveExerciseStats(name)
    if isResourceLoaded(GYM_RESOURCES.RTX) then
        TriggerServerEvent("rcore_prison:server:UpdateExerciseStats", name, SH.zoneId)
        dbg.debug('Successfully increased stats using RTX GYM resource.')
    else
        dbg.bridge('Failed to find any supported GYM resource for increasing stats.')
    end
end
