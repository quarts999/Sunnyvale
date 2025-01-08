-- client/main.lua
local QBCore = exports['qb-core']:GetCoreObject()

-- Listen for the event when the sticky note is used
RegisterNetEvent('gpstracker:revealLocation', function()
    local playerPed = PlayerPedId()

    -- Request the animation dictionary
    RequestAnimDict("cellphone@")
    while not HasAnimDictLoaded("cellphone@") do
        Citizen.Wait(100)
    end

    -- Spawn a phone/tablet prop and attach it to the player's hand
    local model = GetHashKey("p_amb_phone_01")  -- You can replace this with any other model, like "prop_battery_01" for a tablet
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(100)
    end
    local phone = CreateObject(model, 0, 0, 0, true, true, false)
    AttachEntityToEntity(phone, playerPed, GetPedBoneIndex(playerPed, 28422), 0.00, -0.02, 0.02, 0.0, 0.0, 0.0, true, true, false, true, 1, true)

    -- Play the tablet animation during the progress bar
    TaskPlayAnim(playerPed, "cellphone@", "cellphone_text_read_base", 8.0, -8.0, -1, 50, 0, false, false, false)

    -- Show progress bar for revealing the hidden location
    QBCore.Functions.Progressbar("revealing_location", "Revealing Hidden Location...", 5000, false, true, {
        disableMovement = false,  -- Allow movement
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- When progress bar is complete
        -- Stop the animation and remove the map prop once progress is done
        ClearPedTasks(playerPed)
        DeleteObject(map)
        -- Remove the prop after the animation finishes
        DetachEntity(phone, true, true)  -- Detach the keycard or prop from the player's hand
        DeleteObject(phone)  -- Delete the prop from the game world
    
        -- Notify the player that a hidden location has been revealed
        QBCore.Functions.Notify("A hidden location has been revealed!", "success")
    
        -- Get a random hidden location from config
        local randomLocation = Config.HiddenLocations[math.random(1, #Config.HiddenLocations)]
    
        -- Create a blip on the map for the selected location with configurable properties
        local blip = AddBlipForCoord(randomLocation.x, randomLocation.y, randomLocation.z)
        
        -- Apply configurable blip properties
        SetBlipSprite(blip, Config.BlipConfig.sprite)         -- Sprite
        SetBlipColour(blip, Config.BlipConfig.color)          -- Color
        SetBlipScale(blip, Config.BlipConfig.scale)           -- Scale
        
        -- Correct method to set the blip's name
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.BlipConfig.name)        -- Name
        EndTextCommandSetBlipName(blip)
    
        -- Create a radius around the blip with configurable properties
        local radiusBlip = AddBlipForRadius(randomLocation.x, randomLocation.y, randomLocation.z, Config.BlipConfig.radiusScale)
        SetBlipColour(radiusBlip, Config.BlipConfig.radiusColor)
        SetBlipAlpha(radiusBlip, Config.BlipConfig.radiusAlpha)
    
        -- Check the player's position and remove the blip if they are within 5 meters
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(500)
    
                local coords = GetEntityCoords(playerPed)
                local distance = Vdist(coords.x, coords.y, coords.z, randomLocation.x, randomLocation.y, randomLocation.z)
    
                if distance <= 10.0 then
                    -- Remove the blips once the player arrives at the location
                    RemoveBlip(blip)
                    RemoveBlip(radiusBlip)
    
                    -- Notify the player that they have arrived at the hidden location
                    QBCore.Functions.Notify("You have arrived at the hidden location!", "success")
                    break
                end
            end
        end)
    end, function() -- If progress bar is canceled
        -- Stop the animation and remove the map prop if the progress bar was canceled
        ClearPedTasks(playerPed)
        DeleteObject(map)
    
        -- Notify player if progress was interrupted
        QBCore.Functions.Notify("You canceled revealing the hidden location.", "error")
    end)
end)
