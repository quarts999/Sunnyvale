


RegisterServerEvent("PlasmaKart:ServerSpawnedKartFunction")
AddEventHandler("PlasmaKart:ServerSpawnedKartFunction", function(kartID,kartPlate)
	local player = source
	local kart = NetworkGetEntityFromNetworkId(kartID)
	-- This is Called when the kart is created
	-- You can add here all that you need (server side)
	-- key for hotwire script
	-- fuel
	-- etc...
	
	-- kartID is the network id of the kart
	-- kart is the id of the entity
	-- kartPlate is the license plate of the kart
	
	aff(tostring(player).." SpawnedKartFunction")
	
end)

RegisterServerEvent("PlasmaKart:ExtCpPassed")
AddEventHandler("PlasmaKart:ExtCpPassed", function(currentShop,curCP,curLap,kart)
	local player = source
	-- This is called each time the kart pass a checkpoint
	-- you can add here all that you need (server side)
	-- repair function
	-- refuel
	-- etc...
	-- 
	-- currentShop is the place where the race as been launch (if you have only one lobby this will be the same each time)
	-- curCP  this is the number of the currentCP passed
	-- curLap this is the number of the current lap
	-- kart this is the kart entity
	aff(tostring(player).." ExtCpPassed")
end)

RegisterServerEvent("PlasmaKart:EXTDeleteKart")
AddEventHandler("PlasmaKart:EXTDeleteKart", function(kartID)
	local kart = NetworkGetEntityFromNetworkId(kartID)
	-- This is called each time the kart is deleted
	-- you can add here all that you need (server side)
	-- remove key func etc...
	-- 

	-- kartID this is the kart entity ID
	
end)