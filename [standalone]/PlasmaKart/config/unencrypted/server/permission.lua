
RegisterServerEvent('PlasmaKart:AskForCreateAGame')
AddEventHandler('PlasmaKart:AskForCreateAGame', function(data,maxPlayer)
	local player = source
	local canCreateAlobby = true
		
	-- This is called when someone try to create a lobby
	-- you can add here all that you need (server side)
	-- check if have the any role
	-- payment
	-- etc...
	-- 
	-- data contain all the data needed to create the session
	-- data.sessionname => the lobby name
	-- data.gamemode => Classic Race / Battle Race
	-- data.maps => current maps
	-- data.nblap => number of lap
	-- data.cylindre => kart power (50cc,100cc etc...)
	-- data.curshop => the place where the race as been launch (if you have only one lobby this will be the same each time)

	if canCreateAlobby then
		aff("canCreateAlobby")
		TriggerEvent("PlasmaKart:NewSession",data,player,maxPlayer)
	else
		notification(player,trad[lang]["CantCreateASession"],"error")
	end


end)


RegisterServerEvent('PlasmaKart:CanJoinAGame')
AddEventHandler('PlasmaKart:CanJoinAGame', function(player,IDX)
	local canJoinAlobby = true
	
	
	
	-- This is called when someone try to join a lobby
	-- you can add here all that you need (server side)
	-- check if have the any role
	-- payment
	-- etc...
	-- player is the source id of the player
	-- IDX is the id of the game
	
	
	
	
	if canJoinAlobby then
		TriggerEvent("PlasmaKart:JoinAGame",player,IDX)
	else
	
	end
end)