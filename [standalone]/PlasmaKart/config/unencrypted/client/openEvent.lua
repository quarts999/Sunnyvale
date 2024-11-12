local isCostumed = false

RegisterNetEvent("PlasmaKart:SpawnedKartFunction")
AddEventHandler("PlasmaKart:SpawnedKartFunction", function(kart,kartPlate)
	-- This is Called when the kart is created
	-- You can add here all that you need (client side)
	-- key for hotwire script
	-- fuel
	-- etc...
	
	-- kart is the id of the entity
	-- kartPlate is the license plate of the kart
	
	aff("SpawnedKartFunction")
	
	exports['LegacyFuel']:SetFuel(vehicle, 100.0)
	SetEntityInvincible(vehicle,true)

	SetVehicleFuelLevel(kart, 100.0)

	TriggerEvent("vehiclekeys:client:SetOwner",kartPlate)
	TriggerEvent("cd_garage:AddKeys",kartPlate)
	TriggerEvent('seatbeltToggle')
end)


RegisterNetEvent("PlasmaKart:ExtCpPassed")
AddEventHandler("PlasmaKart:ExtCpPassed", function(currentShop,curCP,curLap,kart)
	aff("ExtCpPassed")
	
	exports['LegacyFuel']:SetFuel(vehicle, 100.0)
	-- SetEntityInvincible(vehicle,true)

	SetVehicleFuelLevel(kart, 100.0)
	-- This is called each time the kart pass a checkpoint
	-- you can add here all that you need (client side)
	-- repair function
	-- refuel
	-- etc...
	-- 
	-- currentShop is the place where the race as been launch (if you have only one lobby this will be the same each time)
	-- curCP  this is the number of the currentCP passed
	-- curLap this is the number of the current lap
	-- kart this is the kart entity
end)


RegisterNetEvent("PlasmaKart:switchTenu")
AddEventHandler("PlasmaKart:switchTenu", function(put)
	switchTenu(put)
end)


local playerTenu = {
[3] = {model = 0, color = 2},
[4] = {model = 0, color = 2},
[6] = {model = 0, color = 3},
						   
[7] = {model = 0, color = 2},
[8] = {model = 0, color = 2},
[11] = {model = 0, color = 2}
}

local playerMask = {model = 0, color = 2}

function switchTenu(put)
	local sex 
	local ped = PlayerPedId()
	if IsPedModel(ped,GetHashKey('mp_m_freemode_01')) then
		sex = "men"
	elseif IsPedModel(ped,GetHashKey('mp_f_freemode_01')) then
		sex = "women"
	else
		sex = "ped"
	end
	if sex ~= "ped" then
		if isCostumed == false and put == true then -- Si n' pas sa tenue
			playerTenu[11].model = GetPedDrawableVariation(ped,11)
			playerTenu[11].color = GetPedTextureVariation(ped,11)
			
			playerTenu[4].model = GetPedDrawableVariation(ped,4)
			playerTenu[4].color = GetPedTextureVariation(ped,4)
			
			playerTenu[6].model = GetPedDrawableVariation(ped,6)
			playerTenu[6].color = GetPedTextureVariation(ped,6)
			
			playerTenu[7].model = GetPedDrawableVariation(ped,7)
			playerTenu[7].color = GetPedTextureVariation(ped,7)
			
			playerTenu[8].model = GetPedDrawableVariation(ped,8)
			playerTenu[8].color = GetPedTextureVariation(ped,8)
			
			playerTenu[3].model = GetPedDrawableVariation(ped,3)
			playerTenu[3].color = GetPedTextureVariation(ped,3)
			if sex == "men" then
				isCostumed = true
				local randColor = 0
				if (GetNumberOfPedTextureVariations(ped,4,TenuHomme[4].model)-2) > 0 then
					randColor = math.random(0,GetNumberOfPedTextureVariations(ped,4,TenuHomme[4].model)-2)
				end
				-- local randColor = 
				for k,v in pairs(TenuHomme) do
					if v.color ~= nil then
					SetPedComponentVariation(ped,k,v.model, v.color,2)
					else
					SetPedComponentVariation(ped,k,v.model,randColor,2)
					end
				end
				if useCustomMask then
					local randMath = math.random(1,2)
					playerMask.model = GetPedDrawableVariation(PlayerPedId(), 1)
					playerMask.color = GetPedTextureVariation(PlayerPedId(), 1)
					aff("Mask : "..tostring(playerMask.model).." "..tostring(playerMask.color))
					SetPedComponentVariation(PlayerPedId(), 1, MaskHomme[randMath].model, MaskHomme[randMath].colorA, 0)
				end
			else
				isCostumed = true
				local randColor = 0
				if (GetNumberOfPedTextureVariations(ped,4,TenuHomme[4].model)-2) > 0 then
					randColor = math.random(0,GetNumberOfPedTextureVariations(ped,4,TenuFemme[4].model)-2)
				end
				
				-- local randColor = math.random(2,GetNumberOfPedTextureVariations(ped,4,TenuFemme[4].model)-1)
				for k,v in pairs(TenuFemme) do
					if v.color ~= nil then
					SetPedComponentVariation(ped,k,v.model, v.color,2)
					else
					SetPedComponentVariation(ped,k,v.model,randColor,2)
					end
				end
				if useCustomMask then
					local randMath = math.random(1,2)
					playerMask.model = GetPedDrawableVariation(PlayerPedId(), 1)
					playerMask.color = GetPedTextureVariation(PlayerPedId(), 1)
					aff("Mask : "..tostring(playerMask.model).." "..tostring(playerMask.color))
					SetPedComponentVariation(PlayerPedId(), 1, MaskFemme[randMath].model, MaskFemme[randMath].colorB, 0)
				end
			end
		elseif isCostumed == true and put == false then
			isCostumed = false
			for k,v in pairs(playerTenu) do
				SetPedComponentVariation(ped,k,v.model,v.color,2)
			end
			if useCustomMask then
				SetPedComponentVariation(PlayerPedId(), 1, playerMask.model, playerMask.color, 0)
			end
		end
	else
		aff("Use custom ped so no outfit")
	end
end


RegisterNetEvent("PlasmaKart:EXTSendTheEnd")
AddEventHandler("PlasmaKart:EXTSendTheEnd", function()
	aff("ExtCpPassed")
	-- This is called when the race is finished
end)