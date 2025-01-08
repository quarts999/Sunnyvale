----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local TargetName = Config.CoreSettings.TargetName
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

--<!>-- NOTIFICATIONS --<!>--
-- Notifications
RegisterNetEvent('boii-mining:notify', function(msg, type)
    Core.Functions.Notify(msg, type)
end)
--<!>-- NOTIFICATIONS --<!>--

--<!>-- BLIPS --<!>--
CreateThread(function()
    for k, v in pairs(Config.Blips) do
        if v.useblip then
            v.blip = AddBlipForCoord(v['coords'].x, v['coords'].y, v['coords'].z)
            SetBlipSprite(v.blip, v.id)
            SetBlipDisplay(v.blip, 4)
            SetBlipScale(v.blip, v.scale)
            SetBlipColour(v.blip, v.colour)
            SetBlipAsShortRange(v.blip, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(v.title)
            EndTextCommandSetBlipName(v.blip)
        end
    end
end)
--<!>-- BLIPS --<!>--

--<!>-- PEDS --<!>--
CreateThread(function()
    for k, v in pairs(Config.Peds) do
        if v.useped then
            RequestModel(GetHashKey(v.model))
            while not HasModelLoaded(GetHashKey(v.model)) do
                Wait(1)
            end
            MiningPeds = CreatePed(0, v.model, v['coords'].x, v['coords'].y, v['coords'].z-1, v['coords'].w, false, false)
            FreezeEntityPosition(MiningPeds, true)
            SetEntityInvincible(MiningPeds, true)
            SetBlockingOfNonTemporaryEvents(MiningPeds, true)
            TaskStartScenarioInPlace(MiningPeds, v.scenario, 0, true)
            exports[TargetName]:AddEntityZone('mining_peds'..MiningPeds, MiningPeds, {
                name = 'mining_peds'..MiningPeds,
                heading = GetEntityHeading(MiningPeds),
                debugPoly = false,
            }, {
                options = {
                    {   
                        icon = v.icon,
                        label = v.label,
                        event = v.event,
                        canInteract = function(entity)
                            if IsPedDeadOrDying(entity, true) or IsPedAPlayer(entity) or IsPedInAnyVehicle(PlayerPedId()) then return false end
                            return true
                        end,    
                    },
                },
                distance = v.distance
            })
        end
    end
end)
--<!>-- PEDS --<!>--

--<!>-- LIGHTS --<!>--
CreateThread(function()
    for k, v in pairs(Config.Quarry.Mining.Lights) do
        RequestModel(GetHashKey(v.model))
            while not HasModelLoaded(GetHashKey(v.model)) do
                Wait(1)
            end
        local QuarryLights = CreateObject(v.model, v['coords'].x, v['coords'].y, v['coords'].z, true, true, false)
        SetEntityHeading(QuarryLights, v['coords'].w)
        SetEntityInvincible(QuarryLights, true)
        SetBlockingOfNonTemporaryEvents(QuarryLights, true)
        FreezeEntityPosition(QuarryLights, true)
        PlaceObjectOnGroundProperly(QuarryLights)
        Objects[#Objects+1] = QuarryLights
    end
end)

CreateThread(function()
    for k, v in pairs(Config.Mine.Caving.Lights) do
        RequestModel(GetHashKey(v.model))
            while not HasModelLoaded(GetHashKey(v.model)) do
                Wait(1)
            end
        local MineLights = CreateObject(v.model, v['coords'].x, v['coords'].y, v['coords'].z, true, true, false)
        SetEntityHeading(MineLights, v['coords'].w)
        SetEntityInvincible(MineLights, true)
        SetBlockingOfNonTemporaryEvents(MineLights, true)
        FreezeEntityPosition(MineLights, true)
        PlaceObjectOnGroundProperly(MineLights)
        MineObjects[#MineObjects+1] = MineLights
    end
end)
--<!>-- LIGHTS --<!>--

--<!>-- SMELTING --<!>--
for k, v in pairs(Config.Smelting.Locations.Foundry) do
    exports[TargetName]:AddCircleZone(v.name, v.coords, v.radius, { 
            name= v.name, 
            debugPoly= v.debugPoly, 
            useZ= v.useZ, 
        },{ 
        options = { 
            {
                icon = Language.Mining.Smelting.Target['icon'],
                label = Language.Mining.Smelting.Target['label'],
                event = 'boii-mining:cl:SmeltingMenu'
            }, 
        },
        distance = v.distance
    })
end

if Config.MLO.k4mb1_cave then
    for k, v in pairs(Config.Smelting.Locations.KambiCave) do
        exports[TargetName]:AddCircleZone(v.name, v.coords, v.radius, { 
                name= v.name, 
                debugPoly= v.debugPoly, 
                useZ= v.useZ, 
            },{ 
            options = { 
                {
                    icon = Language.Mining.Smelting.Target['icon'],
                    label = Language.Mining.Smelting.Target['label'],
                    event = 'boii-mining:cl:SmeltingMenu'
                }, 
            },
            distance = v.distance
        })
    end
end
--<!>-- SMELTING --<!>--

--<!>-- OPEN SHOP --<!>--
RegisterNetEvent('boii-mining:cl:OpenStore', function(args)
    items = {}
    items.label = args.label
    items.items = args.items
    items.slots = #args.items
    TriggerServerEvent('inventory:server:OpenInventory', 'shop', args.label, items)
end)
--<!>-- OPEN SHOP --<!>--