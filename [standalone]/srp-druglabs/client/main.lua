QBCore = exports['qb-core']:GetCoreObject()

local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

local function openHouseAnim()
    local ped = PlayerPedId()
    loadAnimDict("anim@heists@keycard@")
    TaskPlayAnim(ped, "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0 )
    Wait(100)
    -- if Shared.WeedLab.EnableSound then
    --     -- TriggerServerEvent("InteractSound_SV:PlayOnSource", "facility_alarm", 0.1)
    -- end
    DoScreenFadeOut(800)
    Wait(850)
    DoScreenFadeIn(900)
    ClearPedTasks(ped)
end

-- weedlab (zone)
CreateThread(function ()
    if Shared.WeedLab.EnableTp then
        exports['qb-target']:AddBoxZone('weedlab-enter', vector3(1569.67, -2129.59, 78.33), 3.0, 3.0, {
            name = 'weedlab-enter',
            heading = 90,
            minZ = 78.27 - 2,
            maxZ = 80.27 + 2,
            -- debugPoly = Shared.Debug,
        }, {
            options = {
                {
                    type = 'client',
                    event = 'srp-druglabs:client:EnterLab',
                    icon = 'fa-solid fa-warehouse',
                    label = 'Enter Lab',
                }
            },
            distance = 2.0
        })
        exports['qb-target']:AddBoxZone('weedlab-exit', vector3(1066.65, -3183.45, -39.16), 1.5, 0.5, {
            name = 'weedlab-exit',
            heading = 0,
            minZ = -39.16 - 2,
            maxZ = -39.16 + 2,
            -- debugPoly = Shared.Debug,
        }, {
            options = {
                {
                    type = 'client',
                    event = 'srp-druglabs:client:ExitLab',
                    icon = 'fa-solid fa-warehouse',
                    label = 'Exit Lab',
                }
            },
            distance = 2.0
        })
    end
end)

-- cokelab (zone)
CreateThread(function ()
    if Shared.WeedLab.EnableTp then
        exports['qb-target']:AddBoxZone('cokelab-enter', vector3(-1981.88, -241.61, 34.98), 3.0, 3.0, {
            name = 'cokelab-enter',
            heading = 90,
            minZ = 30.27 - 2,
            maxZ = 40.27 + 2,
            -- debugPoly = Shared.Debug,
        }, {
            options = {
                {
                    type = 'client',
                    event = 'srp-druglabs:client:EnterLab2',
                    icon = 'fa-solid fa-warehouse',
                    label = 'Enter Lab',
                }
            },
            distance = 2.0
        })
        exports['qb-target']:AddBoxZone('cokelab-exit', vector3(1088.61, -3187.47, -38.99), 1.5, 0.5, {
            name = 'cokelab-exit',
            heading = 0,
            minZ = -39.16 - 2,
            maxZ = -39.16 + 2,
            -- debugPoly = Shared.Debug,
        }, {
            options = {
                {
                    type = 'client',
                    event = 'srp-druglabs:client:ExitLab2',
                    icon = 'fa-solid fa-warehouse',
                    label = 'Exit Lab',
                }
            },
            distance = 2.0
        })
    end
end)

-- methlab (zone)
CreateThread(function ()
    if Shared.WeedLab.EnableTp then
        exports['qb-target']:AddBoxZone('methlab-enter', vector3(-39.13, 6420.45, 31.69), 3.0, 3.0, {
            name = 'methlab-enter',
            heading = 90,
            minZ = 30.27 - 2,
            maxZ = 40.27 + 2,
            -- debugPoly = Shared.Debug,
        }, {
            options = {
                {
                    type = 'client',
                    event = 'srp-druglabs:client:EnterLab3',
                    icon = 'fa-solid fa-warehouse',
                    label = 'Enter Lab',
                }
            },
            distance = 2.0
        })
        exports['qb-target']:AddBoxZone('methlab-exit', vector3(996.87, -3200.66, -35.79), 1.5, 0.5, {
            name = 'methlab-exit',
            heading = 0,
            minZ = -38.39 - 2,
            maxZ = -38.39 + 2,
            -- debugPoly = Shared.Debug,
        }, {
            options = {
                {
                    type = 'client',
                    event = 'srp-druglabs:client:ExitLab3',
                    icon = 'fa-solid fa-warehouse',
                    label = 'Exit Lab',
                }
            },
            distance = 2.0
        })
    end
end)

-- weedlab (enter)
-- weedlab (enter)
RegisterNetEvent('srp-druglabs:client:EnterLab', function()
    local hasItem = QBCore.Functions.HasItem(Shared.LabkeyItem)
    
    if Shared.WeedLab.RequireKey then
        if not hasItem then
            QBCore.Functions.Notify('You do not have the required keycard!', 'error')
            return -- Prevent entering if the player doesn't have the required key
        end
    end
    
    local ped = PlayerPedId()    
    openHouseAnim()
    TriggerServerEvent('srp-druglabs:server:NotifyLabEntered')
    TriggerServerEvent('srp-druglabs:server:RemoveLabKey')

    SetEntityCoords(ped, 1066.2, -3183.38, -39.16)
    SetEntityHeading(ped, 89.3)
end)


-- cokelab (enter)
RegisterNetEvent('srp-druglabs:client:EnterLab2', function()
    
    local hasItem = QBCore.Functions.HasItem(Shared.LabkeyItem2)
    
    if Shared.WeedLab.RequireKey then
        if not hasItem then
            QBCore.Functions.Notify('You dont have the required key..', 'error')
            return
        end
    end
    local ped = PlayerPedId()    
    openHouseAnim()
    TriggerServerEvent('srp-druglabs:server:NotifyLabEntered')
    TriggerServerEvent('srp-druglabs:server:RemoveLabKey2')

    -- TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 100, "facility_alarm", 0.8)
    SetEntityCoords(ped, 1088.74, -3188.33, -38.99)
    SetEntityHeading(ped, 89.3)
end)

-- methlab (enter)
RegisterNetEvent('srp-druglabs:client:EnterLab3', function()
    
    local hasItem = QBCore.Functions.HasItem(Shared.LabkeyItem3)
    
    if Shared.WeedLab.RequireKey then
        if not hasItem then
            QBCore.Functions.Notify('You dont have the required key..', 'error')
            return
        end
    end
    local ped = PlayerPedId()    
    openHouseAnim()
    TriggerServerEvent('srp-druglabs:server:NotifyLabEntered')
    TriggerServerEvent('srp-druglabs:server:RemoveLabKey3')

    -- TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 100, "facility_alarm", 0.8)
    SetEntityCoords(ped, 1009.5, -3196.6, -38.99682)
    SetEntityHeading(ped, 89.3)
end)

-- weedlab (exit)
RegisterNetEvent('srp-druglabs:client:ExitLab', function()
    local ped = PlayerPedId()    
    openHouseAnim()
    SetEntityCoords(ped, 1569.67, -2129.59, 78.33)
    SetEntityHeading(ped, 180.95)
end)

-- cokelab (exit)
RegisterNetEvent('srp-druglabs:client:ExitLab2', function()
    local ped = PlayerPedId()    
    openHouseAnim()
    SetEntityCoords(ped, -1960.71, -249.45, 34.92)
end)

-- methlab (exit)
RegisterNetEvent('srp-druglabs:client:ExitLab3', function()
    local ped = PlayerPedId()    
    openHouseAnim()
    SetEntityCoords(ped, -39.13, 6420.45, 31.69)
end)