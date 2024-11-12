function Utils.Functions:CustomFuelExport(vehicle)
    -- Call the exported GetFuel function
    local fuelLevel = exports['Refuel_Script']:GetFuel(vehicle)  -- Replace 'your_resource_name' with your actual resource name
    return fuelLevel
end

function Utils.Functions:CustomVoiceResource()
    -- Add your custom sound system events.
    -- for ex:
    --[[
        AddEventHandler("customVoice:setVoiceRange", function(mode)
            Koci.Client.HUD.data.bars.voice.range = mode
        end)

        AddEventHandler("customVoice:setRadioTalking", function(radioTalking)
            Koci.Client.HUD.data.bars.voice.radio = radioTalking
        end)
    --]]
end

local function SetVehicleCruiseControlState(state)
    Koci.Client.HUD.data.vehicle.cruiseControlStatus = state
end
local function SetVehicleSeatbeltState(state)
    Koci.Client.HUD.data.vehicle.isSeatbeltOn = state
end

function Utils.Functions:GetPedVehicleSeat(ped, vehicle)
    for i = -1, 16 do
        if (GetPedInVehicleSeat(vehicle, i) == ped) then return i end
    end
    return -1
end

exports("CruiseControlState", function(...)
    SetVehicleCruiseControlState(...)
end)
exports("SeatbeltState", function(...)
    SetVehicleSeatbeltState(...)
end)
