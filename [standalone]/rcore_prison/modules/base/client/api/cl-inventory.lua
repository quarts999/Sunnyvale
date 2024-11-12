NetworkService.EventListener('heartbeat', function(eventType, data)
    local plyPed = PlayerPedId()

    if Bridge.Inventory == Inventories.QS then
        -- ?? Should be handled by inventory, but for some unk reasons its not.
        GiveWeaponToPed(plyPed, `WEAPON_UNARMED`, 0, false, true)
        SetCurrentPedWeapon(plyPed, `WEAPON_UNARMED`, true)
        RemoveAllPedWeapons(plyPed, true)
    elseif Bridge.Inventory == Inventories.ESX then
        GiveWeaponToPed(plyPed, `WEAPON_UNARMED`, 0, false, true)
        SetCurrentPedWeapon(plyPed, `WEAPON_UNARMED`, true)
        RemoveAllPedWeapons(plyPed, true)
    elseif Bridge.Inventory == Inventories.CORE then
        GiveWeaponToPed(plyPed, `WEAPON_UNARMED`, 0, false, true)
        SetCurrentPedWeapon(plyPed, `WEAPON_UNARMED`, true)
        RemoveAllPedWeapons(plyPed, true)
    elseif Bridge.Framework == Framework.Standalone then
        GiveWeaponToPed(plyPed, `WEAPON_UNARMED`, 0, false, true)
        SetCurrentPedWeapon(plyPed, `WEAPON_UNARMED`, true)
        RemoveAllPedWeapons(plyPed, true)
    elseif Bridge.Inventory == Inventories.QB then
        TriggerEvent('qb-weapons:ResetHolster')
        SetCurrentPedWeapon(plyPed, `WEAPON_UNARMED`, true)
        RemoveAllPedWeapons(plyPed, true)
    end
end)

function HandleInventoryBusyState(state)
    if not type(state) ~= "boolean" then
        return
    end

    local plyState = LocalPlayer.state

    if isResourcePresentProvideless(Inventories.OX) then
        plyState:set('invBusy', state, true)
    elseif Bridge.Framework == Framework.QBCore then
        plyState:set('inv_busy', state, true)
    end

    dbg.critical('Setting inventory busy state: %s', state)
end