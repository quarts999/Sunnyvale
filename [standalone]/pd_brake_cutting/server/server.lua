RegisterServerEvent('pd_brakes:CutBrakes')
AddEventHandler('pd_brakes:CutBrakes', function(serverVehicle)
    local player = source
    local vehicle = NetworkGetEntityFromNetworkId(serverVehicle)

    Entity(vehicle).state.cutBrakes = true
end)

RegisterServerEvent('pd_brakes:BrakeFailure')
AddEventHandler('pd_brakes:BrakeFailure', function(serverVehicle)
    local player = source
    local vehicle = NetworkGetEntityFromNetworkId(serverVehicle)

    Entity(vehicle).state.brakesFailed = true
end)

RegisterServerEvent('pd_brakes:FixVehicle')
AddEventHandler('pd_brakes:FixVehicle', function(serverVehicle)
    local player = source
    local vehicle = NetworkGetEntityFromNetworkId(serverVehicle)

    Entity(vehicle).state.cutBrakes = false
    Entity(vehicle).state.brakesFailed = false
end)

RegisterServerEvent('pd_brakes:UseItem')
AddEventHandler('pd_brakes:UseItem', function()
    local player = source
    UseItem(player)
end)

RegisterServerEvent('pd_brakes:LowerHealth')
AddEventHandler('pd_brakes:LowerHealth', function(netId)
    local entity = NetworkGetEntityFromNetworkId(netId)
    local player_id = NetworkGetEntityOwner(entity)
    TriggerClientEvent('pd_brakes:LowerHealth', player_id, netId)
end)