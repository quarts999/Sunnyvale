local stashExploit = {}

local COOLDOWN_PERIOD = 15000
local MAX_ATTEMPTS = 1

EventLimiterService.RegisterNetEvent('rcore_prison:server:requestStashedItems', 0, 1, function(playerId, state, zoneId)
    if state then
        dbg.debug('Player named %s requested their stashed items', GetPlayerName(playerId))

        local charId = Framework.getIdentifier(playerId)
        if not charId then
            return
        end

        local stashItems = db.FetchStashItems(charId)
        if not stashItems then
            return
        end

        local exploitData = stashExploit[playerId]

        if exploitData then
            local currentTime = GetGameTimer()

            if exploitData.lastFetchTime and (currentTime - exploitData.lastFetchTime) < COOLDOWN_PERIOD then
                if exploitData.attempt >= MAX_ATTEMPTS then
                    Inventory.ClearPlayerInventory(playerId)
                    db.RemoveStashItems(charId)
                    stashExploit[playerId] = nil
                    DropPlayer(playerId, 'Exploit: Attempting to retrieve stash items numerous times (rcore_prison)')
                    return
                end
                exploitData.attempt += 1
            else
                dbg.debug('Cooldown expired. Resetting attempt count.')
                exploitData.attempt = 0
                exploitData.fetch = false
                exploitData.lastFetchTime = currentTime
                dbg.debug('Player named %s cooldown has been reset', GetPlayerName(playerId))
            end
        end

        if not exploitData then
            stashExploit[playerId] = { fetch = false, attempt = 0, lastFetchTime = GetGameTimer() }
            exploitData = stashExploit[playerId]
        end

        local items = stashItems and type(stashItems) == 'string' and json.decode(stashItems)

        if exploitData and not exploitData.fetch and exploitData.attempt == 0 then
            exploitData.fetch = true

            if items and next(items) then
                local state, error_message = pcall(function()
                    return Inventory.addMultipleItems(playerId, items)
                end)

                if state then
                    db.RemoveStashItems(charId)
                    Framework.sendNotification(playerId, _U('STASH.ITEMS_RETURNED'), 'success')
                end
            else
                dbg.debug('Player named %s does not have any stashed items', GetPlayerName(playerId))
                Framework.sendNotification(playerId, _U('STASH.YOU_DONT_HAVE_STASHED_ITEMS'), 'error')
            end
        end
    end
end)