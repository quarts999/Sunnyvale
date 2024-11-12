local Ped, Props, Targets, jacuzzilist, alcoholCount, inJacuzzi = nil, {}, {}, {}, 0, false

AddEventHandler('onResourceStart', function(r) if GetCurrentResourceName() ~= r then return end	QBCore.Functions.GetPlayerData(function(PlayerData) PlayerJob = PlayerData.job onDuty = PlayerJob.onduty end) Ped = PlayerPedId() end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() QBCore.Functions.GetPlayerData(function(PlayerData) PlayerJob = PlayerData.job end) Ped = PlayerPedId() end)
RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo) PlayerJob = JobInfo onDuty = PlayerJob.onduty end)
RegisterNetEvent('QBCore:Client:SetDuty', function(duty) onDuty = duty end)

CreateThread(function()
	for _, v in pairs(Config.Locations) do
		if v.zoneEnable then
			if v.zones and (v.autoClock.enter == true or v.autoClock.exit == true) then
				JobLocation = PolyZone:Create(v.zones, { name = v.label, debugPoly = Config.Debug })
				JobLocation:onPlayerInOut(function(isPointInside)
					if PlayerJob.name == v.job then
						if v.autoClock.enter then if isPointInside and not onDuty then TriggerServerEvent("QBCore:ToggleDuty") end end
						if v.autoClock.exit then if not isPointInside and onDuty then TriggerServerEvent("QBCore:ToggleDuty") end end
					end
				end)
				if Config.PrintDebug then print("^5Debug^7: ^6AutoClock Polyzone ^2Created for ^7'^6"..v.label.."^7'") end
			end
			if v.blip then makeBlip({ coords = v.blip, sprite = v.blipsprite, scale = v.blipscale, disp = v.blipdist, col = v.blipcolor, name = v.label}) end
			local bossroles = {}
			if QBCore.Shared.Jobs and not QBCore.Shared.Jobs[v.job] then print("^5Debug^7: ^1Can't find the job ^7'^6"..v.job.."^7' ^1in the core shared files^7") else
				for grade in pairs(QBCore.Shared.Jobs[v.job].grades) do
					if QBCore.Shared.Jobs[v.job].grades[grade].isboss == true then
						if bossroles[v.job] ~= nil then
							if bossroles[v.job] > tonumber(grade) then bossroles[v.job] = tonumber(grade) end
						else bossroles[v.job] = tonumber(grade)	end
					end
				end
			end
			if v.MLO == "gabz" then
				CreateThread(function()

					Targets["UniPrepared"] =
						exports['qb-target']:AddBoxZone("UniPrepared", vec3(136.13, -1287.12, 29.27-1), 1.7, 0.8, { name="UniPrepared", heading = 30.0, debugPoly=Config.Debug, minZ = 28.37, maxZ = 29.97, },
							{ options = { {  event = "jim-vanillaunicorn:Stash", icon = "fas fa-box-open", label = "Prepared Food", stash = "UniStorage", job = v.job }, }, distance = 1.0 })
					Targets["UniFridge"] =
						exports['qb-target']:AddBoxZone("UniFridge", vec3(129.95, -1280.65, 29.27-1), 1.5, 0.6, { name="UniFridge", heading = 30.0, debugPoly=Config.Debug, minZ=28.22, maxZ=29.22 },
							{ options = { {  event = "jim-vanillaunicorn:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["open_drink_fridge"], job = v.job, shop = Config.DrinkItems, shopname = "UniDrinkfrige" }, }, distance = 1.5 })
					Targets["UniFridge2"] =
						exports['qb-target']:AddBoxZone("UniFridge2", vec3(128.84, -1284.25, 29.27-1), 1.5, 0.6, { name="UniFridge2", heading = 30.0, debugPoly=Config.Debug, minZ=28.27, maxZ=29.27 },
							{ options = { {  event = "jim-vanillaunicorn:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["open_drink_fridge"], job = v.job, shop = Config.DrinkItems, shopname = "UniDrinkfrige" }, }, distance = 1.5 })
					Targets["UniFridge3"] =
						exports['qb-target']:AddBoxZone("UniFridge3", vec3(129.74, -1285.53, 29.27-1), 0.8, 0.4, { name="UniFridge3", heading = 30.0, debugPoly=Config.Debug, minZ=28.27, maxZ=29.27 },
							{ options = { {  event = "jim-vanillaunicorn:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["open_drink_fridge"], job = v.job, shop = Config.DrinkItems, shopname = "UniDrinkfrige" }, }, distance = 1.5 })
					Targets["UniFridge4"] =
						exports['qb-target']:AddBoxZone("UniFridge4", vec3(132.66, -1285.43, 29.27-1), 1.2, 0.6, { name="UniFridge4", heading = 30.0, debugPoly=Config.Debug, minZ=28.27, maxZ=29.27 },
							{ options = { {  event = "jim-vanillaunicorn:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["open_drink_fridge"], job = v.job, shop = Config.DrinkItems, shopname = "UniDrinkfrige" }, }, distance = 1.5 })
					Targets["UniFridge5"] =
						exports['qb-target']:AddBoxZone("UniFridge5", vec3(119.23, -1302.93, 29.27-1), 1.4, 0.6, { name="UniFridge5", heading = 300.0, debugPoly=Config.Debug, minZ=28.27, maxZ=29.27 },
							{ options = { {  event = "jim-vanillaunicorn:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["open_drink_fridge"], job = v.job, shop = Config.DrinkItems, shopname = "UniDrinkfrige" }, }, distance = 1.5 })
					Targets["UniFridge6"] =
						exports['qb-target']:AddBoxZone("UniFridge6", vec3(132.32, -1291.67, 29.27-1), 0.8, 0.6, { name="UniFridge6", heading = 30.0, debugPoly=Config.Debug, minZ = 28.27, maxZ = 30.07, },
							{ options = { {  event = "jim-vanillaunicorn:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["open_food_fridge"],"Open Food Fridge", job = v.job, shop = Config.FoodItems, shopname = "UniFoodfrige" }, }, distance = 2.0 })
					Targets["UniWash1"] =
						exports['qb-target']:AddBoxZone("UniWash1", vec3(136.45, -1289.37, 29.27-1), 0.8, 0.8, { name="UniWash1", heading = 30.0, debugPoly=Config.Debug, minZ = 28.47, maxZ = 29.87, },
							{ options = { { event = "jim-vanillaunicorn:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], job = v.job, coords = vec3(136.45, -1289.37, 29.27) }, }, distance = 1.5	})
					Targets["UniWash2"] =
						exports['qb-target']:AddBoxZone("UniWash2", vec3(130.28, -1286.21, 29.27-1), 0.8, 0.6, { name="UniWash2", heading = 30.0, debugPoly=Config.Debug, minZ = 28.67, maxZ = 29.87, },
							{ options = { { event = "jim-vanillaunicorn:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], coords = vec3(130.28, -1286.21, 29.27) }, }, distance = 1.5 })
					Targets["UniCounter"] =
						exports['qb-target']:AddBoxZone("UniCounter", vec3(128.63, -1284.3, 29.27), 1.1, 1.0, { name="UniCounter", heading = 30.0, debugPoly=Config.Debug, minZ = 29.27, maxZ = 30.07, },
							{ options = { { event = "jim-vanillaunicorn:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_counter"], stash = "UniCounter" }, }, distance = 2.0 })
					Targets["UniReceipt"] =
						exports['qb-target']:AddBoxZone("UniReceipt", vec3(129.19, -1284.95, 29.27), 0.6, 0.6, { name="UniReceipt", heading = 30.0, debugPoly=Config.Debug, minZ = 29.27, maxZ = 30.07, },
							{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = v.job,
											img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/1/10/VanillaUnicorn-GTAV-Logo.png/ width=225px></p>"
											} }, distance = 2.0 })
					Targets["UniReceipt2"] =
						exports['qb-target']:AddBoxZone("UniReceipt2", vec3(133.0, -1286.0, 29.27), 0.6, 0.6, { name="UniReceipt2", heading = 30.0, debugPoly=Config.Debug, minZ = 29.27, maxZ = 30.07, },
							{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = v.job,
											img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/1/10/VanillaUnicorn-GTAV-Logo.png/ width=225px></p>"
											} }, distance = 2.0 })
					Targets["UniReceipt3"] =
						exports['qb-target']:AddBoxZone("UniReceipt3", vec3(118.96, -1303.18, 29.27), 0.6, 0.6, { name="UniReceipt3", heading = 30.0, debugPoly=Config.Debug, minZ = 29.07, maxZ = 29.87, },
							{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = v.job,
											img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/1/10/VanillaUnicorn-GTAV-Logo.png/ width=225px></p>"
											} }, distance = 2.0 })
					Targets["UniCocktails"] =
						exports['qb-target']:AddBoxZone("UniCocktails", vec3(130.3, -1281.51, 29.27), 0.6, 0.6, { name="UniCocktails", heading = 30.0, debugPoly=Config.Debug, minZ=28.87, maxZ=29.87 },
							{ options = { { event = "jim-vanillaunicorn:Crafting", icon = "fas fa-cocktail", label = Loc[Config.Lan].targetinfo["prepare_cocktails"], job = v.job, craftable = Crafting.Cocktails, header = Loc[Config.Lan].menu["cocktail"], coords = vec3(130.3, -1281.51, 29.27)
						}, }, distance = 2.0 })
					Targets["UniTap"] =
						exports['qb-target']:AddBoxZone("UniTap", vec3(128.0, -1283.14, 29.27), 0.6, 0.5, { name="UniTap", heading = 30.0, debugPoly=Config.Debug, minZ = 29.27, maxZ = 29.87, },
							{ options = { { event = "jim-vanillaunicorn:Crafting", icon = "fas fa-beer", label = Loc[Config.Lan].targetinfo["pour_beer"], job = v.job, craftable = Crafting.Beer, header = Loc[Config.Lan].menu["beer"], coords = vec3(128.0, -1283.14, 29.27)
						}, }, distance = 1.5 })
					Targets["UniCoffee"] =
						exports['qb-target']:AddBoxZone("UniCoffee", vec3(131.53, -1282.96, 29.27), 0.5, 0.5, { name="UniCoffee", heading = 30.0, debugPoly=Config.Debug, minZ = 28.87, maxZ = 30.07, },
							{ options = { { event = "jim-vanillaunicorn:Crafting", icon = "fas fa-mug-hot", label = Loc[Config.Lan].targetinfo["pour_coffee"], job = v.job, craftable = Crafting.Coffee, header = Loc[Config.Lan].menu["coffee"], coords = vec3(131.53, -1282.96, 29.27)
						}, }, distance = 2.0 })
					Targets["UniClockin"] =
						exports['qb-target']:AddBoxZone("UniClockin", vec3(102.19, -1299.53, 28.77), 0.8, 0.3, { name="UniClockin", heading = 30.0, debugPoly=Config.Debug, minZ = 28.0, maxZ = 32.0, },
							{ options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = v.job }, }, distance = 2.0 })
					Targets["UniBoss"] =
						exports['qb-target']:AddBoxZone("UniBoss", vec3(96.19, -1292.77, 29.26), 0.6, 0.6, { name="UniBoss", heading = 45.0, debugPoly=Config.Debug, minZ = 28.0, maxZ = 32.0, },
							{ options = { { event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].targetinfo["open_bossmenu"], job = bossroles, }, }, distance = 2.0 })
					Targets["UniOven"] =
						exports['qb-target']:AddBoxZone("UniOven", vec3(134.24, -1290.51, 29.27-1), 0.6, 0.5, { name="UniOven", heading = 300.0, debugPoly=Config.Debug, minZ = 28.97, maxZ = 30.07, },
							{ options = { { event = "jim-vanillaunicorn:Crafting", icon = "fas fa-temperature-high", label = Loc[Config.Lan].targetinfo["use_oven"], job = v.job, craftable = Crafting.Food, header = Loc[Config.Lan].menu["oven"], coords = vec3(134.24, -1290.51, 29.27)
						}, }, distance = 2.0 })
					if not Props["pole1"] then
						Props[1] = makeProp({ prop = "prop_strip_pole_01", coords = vec4(108.8, -1289.3, 29.25, 0)}, 1, 0) SetEntityAlpha(Props[1], 0) DisableCamCollisionForEntity(Props[1])
						Props[2] = makeProp({ prop = "prop_strip_pole_01", coords = vec4(104.77, -1294.48, 29.25, 0.0)}, 1, 0) SetEntityAlpha(Props[1], 0) DisableCamCollisionForEntity(Props[2])
						Props[3] = makeProp({ prop = "prop_strip_pole_01", coords = vec4(102.24, -1290.16, 29.25, 0.0)}, 1, 0) SetEntityAlpha(Props[1], 0) DisableCamCollisionForEntity(Props[3])
					end
					-- Prop Changes --
					local proptable = {
						{ prop = "prop_griddle_02", coords = vec4(134.23, -1290.51, 30.13, 210.0) }, { prop = "prop_trailr_fridge", coords = vec4(132.14, -1291.79, 29.27, 120.0) },
						{ prop = "prop_ff_shelves_01", coords = vec4(131.33, -1290.37, 29.27, 120.0) }, { prop = "prop_ff_counter_03", coords = vec4(134.94, -1290.19, 29.27, 210.0) },
						{ prop = "prop_ff_counter_01", coords = vec4(136.18, -1287.1, 29.27, 300.0) }, { prop = "prop_microwave_1", coords = vec4(135.61, -1289.76, 30.19, 210.0) },
						{ prop = "prop_ff_sink_02", coords = vec4(136.72, -1289.26, 29.27, 210.0) }, { prop = "v_res_tt_platepile", coords = vec4(135.98, -1286.75, 30.19, 60.0) },
						{ prop = "v_res_tt_platepile", coords = vec4(137.05, -1289.05, 30.13, 60.0) }, { prop = "v_res_tt_pizzaplate", coords = vec4(136.34, -1287.45, 30.18, 60.0) },
					}
					for _, prop in pairs(proptable) do Props[#Props+1] = makeProp(prop, true, false) end
					Wait(5000)
					CreateModelHide(vec3(132.86, -1288.0, 29.27), 0.2, 1695461688, true)
				end)
			elseif v.MLO == "van" then
				CreateThread(function()
					Targets["UniDoor"] =
						exports['qb-target']:AddBoxZone("UniDoor", vec3(138.12, -1292.51, 29.23), 0.6, 2.6, { name="UniDoor", heading = 30.0, debugPoly=Config.Debug, minZ = 28.23, maxZ = 31.03, },
							{ options = { { event = "jim-vanillaunicorn:Door", icon = "fas fa-door-open", label = Loc[Config.Lan].targetinfo["bar_access"],"Bar Access", job = v.job, door = 1 }, }, distance = 2.0	})
					Targets["UniDoor2"] =
						exports['qb-target']:AddBoxZone("UniDoor2", vec3(132.83, -1288.03, 29.27), 0.6, 1.4, { name="UniDoor2", heading = 30.0, debugPoly=Config.Debug, minZ = 28.27, maxZ = 30.57, },
							{ options = { { event = "jim-vanillaunicorn:Door", icon = "fas fa-door-open", label = Loc[Config.Lan].targetinfo["bar_exit"],"Bar Exit", job = v.job, door = 2 }, }, distance = 2.0 })

					Targets["UniWash1"] =
						exports['qb-target']:AddBoxZone("UniWash1", vec3(130.4, -1286.45, 29.28), 0.8, 0.6, { name="UniWash1", heading = 30.0, debugPoly=Config.Debug, minZ = 28.68, maxZ = 29.28, },
							{ options = { { event = "jim-vanillaunicorn:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], job = v.job, coords = vec3(130.4, -1286.45, 29.28) }, }, distance = 1.5 })

					Targets["UniFridge"] =
						exports['qb-target']:AddBoxZone("UniFridge", vec3(128.89, -1284.18, 29.28), 3.8, 0.5, { name="UniFridge", heading = 30.0, debugPoly=Config.Debug, minZ=28.28, maxZ=29.27 },
							{ options = { {  event = "jim-vanillaunicorn:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["open_drink_fridge"], job = v.job, shop = Config.DrinkItems, shopname = "UniDrinkfrige" }, }, distance = 1.5 })
					Targets["UniFridge2"] =
						exports['qb-target']:AddBoxZone("UniFridge2", vec3(129.72, -1280.61, 29.27), 2.85, 0.5, { name="UniFridge2", heading = 30.0, debugPoly=Config.Debug, minZ=28.27, maxZ=29.27 },
							{ options = { {  event = "jim-vanillaunicorn:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["open_drink_fridge"], job = v.job, shop = Config.DrinkItems, shopname = "UniDrinkfrige" }, }, distance = 1.5 })
					Targets["UniFridge3"] =
						exports['qb-target']:AddBoxZone("UniFridge3", vec3(132.31, -1285.06, 29.27), 3.6, 0.5, { name="UniFridge3", heading = 30.0, debugPoly=Config.Debug, minZ=28.27, maxZ=29.27 },
							{ options = { {  event = "jim-vanillaunicorn:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["open_drink_fridge"], job = v.job, shop = Config.DrinkItems, shopname = "UniDrinkfrige" }, }, distance = 1.5 })
					Targets["UniFridge4"] =
						exports['qb-target']:AddBoxZone("UniFridge4", vec3(129.35, -1279.92, 29.27), 0.75, 0.6, { name="UniFridge4", heading = 50.0, debugPoly=Config.Debug, minZ = 29.47, maxZ = 30.47, },
							{ options = { {  event = "jim-vanillaunicorn:Shop", icon = "fas fa-archive", label = "Open Food Fridge", job = v.job, shop = Config.FoodItems, shopname = "UniFoodfrige" }, }, distance = 2.0 })

					Targets["UniReceipt"] =
						exports['qb-target']:AddBoxZone("UniReceipt", vec3(129.26, -1285.01, 29.27), 0.6, 0.6, { name="UniReceipt", heading = 30.0, debugPoly=Config.Debug, minZ = 29.27, maxZ = 30.07, },
							{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = v.job,
											img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/1/10/VanillaUnicorn-GTAV-Logo.png/ width=225px></p>"
											} }, distance = 2.0 })
					Targets["UniCounter"] =
						exports['qb-target']:AddBoxZone("UniCounter", vec3(128.15, -1283.48, 29.27), 0.8, 1.1, { name="UniCounter", heading = 30.0, debugPoly=Config.Debug, minZ = 29.07, maxZ = 29.87, },
							{ options = { { event = "jim-vanillaunicorn:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_counter"],"Open Counter", stash = "UniCounter" }, }, distance = 2.5 })
					Targets["UniCocktails"] =
						exports['qb-target']:AddBoxZone("UniCocktails", vec3(130.97, -1282.68, 29.27), 0.55, 0.4, { name="UniCocktails", heading = 30.0, debugPoly=Config.Debug, minZ= 29.27, maxZ= 29.87 },
							{ options = { { event = "jim-vanillaunicorn:Crafting", icon = "fas fa-cocktail", label = Loc[Config.Lan].targetinfo["prepare_cocktails"], job = v.job, craftable = Crafting.Cocktails, header = Loc[Config.Lan].menu["cocktail"], coords = vec3(130.97, -1282.68, 29.27)
						}, }, distance = 2.0 })
					Targets["UniCoffee"] =
						exports['qb-target']:AddBoxZone("UniCoffee", vec3(130.86, -1281.61, 29.27), 0.4, 0.6, { name="UniCoffee", heading = 30.0, debugPoly=Config.Debug, minZ = 29.27, maxZ = 30.07, },
							{ options = { { event = "jim-vanillaunicorn:Crafting", icon = "fas fa-mug-hot", label = Loc[Config.Lan].targetinfo["pour_coffee"], job = v.job, craftable = Crafting.Coffee, header = Loc[Config.Lan].menu["coffee"], coords = vec3(130.86, -1281.61, 29.27)
						}, }, distance = 2.0 })
					Targets["UniOven"] =
						exports['qb-target']:AddBoxZone("UniOven", vec3(133.22, -1286.38, 29.27), 0.4, 0.8, { name="UniOven", heading = 300.0, debugPoly=Config.Debug, minZ = 29.27, maxZ = 29.87, },
							{ options = { { event = "jim-vanillaunicorn:Crafting", icon = "fas fa-temperature-high", label = Loc[Config.Lan].targetinfo["use_oven"], job = v.job, craftable = Crafting.Food, header = Loc[Config.Lan].menu["oven"], coords = vec3(133.22, -1286.38, 29.27)
						}, }, distance = 2.0 })

					Targets["UniTap"] =
						exports['qb-target']:AddBoxZone("UniTap", vec3(128.08, -1282.65, 29.27), 0.2, 0.3, { name="UniTap", heading = 30.0, debugPoly=Config.Debug, minZ = 29.27, maxZ = 29.87, },
							{ options = { { event = "jim-vanillaunicorn:Crafting", icon = "fas fa-beer", label = Loc[Config.Lan].targetinfo["pour_beer"], job = v.job, craftable = Crafting.Beer, header = Loc[Config.Lan].menu["beer"], coords = vec3(128.08, -1282.65, 29.27)
						}, }, distance = 1.5 })
					Targets["UniClockin"] =
						exports['qb-target']:AddBoxZone("UniClockin", vec3(102.19, -1299.53, 28.77), 0.8, 0.3, { name="UniClockin", heading = 30.0, debugPoly=Config.Debug, minZ = 28.0, maxZ = 32.0, },
							{ options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = v.job }, }, distance = 2.0 })
					Targets["UniBoss"] =
						exports['qb-target']:AddBoxZone("UniBoss", vec3(96.19, -1292.77, 29.26), 0.6, 0.6, { name="UniBoss", heading = 45.0, debugPoly=Config.Debug, minZ = 28.0, maxZ = 32.0, },
							{ options = { { event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].targetinfo["open_bossmenu"], job = bossroles, }, }, distance = 2.0 })
					Wait(5000)

					--Model Hides--
					CreateModelHide(vec3(133.51, -1286.62, 30.52), 1.5, `prop_till_02`, true)
					CreateModelHide(vec3(130.97, -1282.67, 30.35), 1.5, `prop_till_02`, true)
					CreateModelHide(vec3(133.51, -1286.62, 30.52), 1.5, `prop_juice_dispenser`, true)
					CreateModelHide(vec3(130.97, -1282.67, 30.35), 1.5, `prop_bar_fruit`, true)
					CreateModelHide(vec3(129.50, -1279.94, 30.33), 1.5, `prop_tv_flat_02`, true)

					-- Prop Changes --
					local proptable = {
						{ prop = "v_res_r_silvrtray", coords = vec4(128.16, -1283.47, 30.29, 120.0)}, {prop = "v_ret_247_ketchup1", coords = vec4(129.34, -1279.91, 30.33+0.2, 320.0)},
						{ prop = "v_med_cor_minifridge", coords = vec4(129.34, -1279.91, 30.33, 320.0)}, {prop = "v_res_mchopboard", coords = vec4(130.97, -1282.67, 30.35, 320.0)},
						{ prop = "prop_griddle_02", coords = vec4(133.22, -1286.39, 30.33, 300.0)}, {prop = "prop_bar_pump_08", coords = vec4(127.99, -1282.71, 30.29, 120.0)},
					}
					for _, prop in pairs(proptable) do Props[#Props+1] = makeProp(prop, true, false) end
				end)
			elseif v.MLO == "gabzbm" then
				CreateThread(function()
					jacuzzilist[#jacuzzilist+1] = { coords = vec3(-1377.35, -612.4, 30.92) }
					jacuzzilist[#jacuzzilist+1] = { coords = vec3(-1377.63, -615.57, 30.92) }
					jacuzzilist[#jacuzzilist+1] = { coords = vec3(-1373.84, -613.4, 30.92) }
					jacuzzilist[#jacuzzilist+1] = { coords = vec3(-1384.28, -605.17, 30.92) }
					jacuzzilist[#jacuzzilist+1] = { coords = vec3(-1381.43, -606.2, 29.9) }
					jacuzzilist[#jacuzzilist+1] = { coords = vec3(-1380.86, -602.64, 29.9) }

				--Table Targets
					for BMTable, tableLoc in pairs(Tables.GabzBM) do
						Targets["BahamaTables"..BMTable] =
							exports ['qb-target']:AddBoxZone("BahamaTables"..BMTable, vec3(tableLoc.x, tableLoc.y, tableLoc.z-1), 0.8, 0.8,
								{ name = "BahamaTables"..BMTable, heading = 216.0, debugPoly = Config.Debug, minZ = tableLoc.z-1, maxZ = tableLoc.z+0.5, },
								{ options = { { event = "jim-vanillaunicorn:Stash", icon = "fas fa-box-open", label = Loc[Config.Lan].targetinfo["open_table"], stash = "Bahama_Table"..BMTable, coords = tableLoc, },},
							distance = 2.0})
					end
				--Tills--
					Targets["GabzBMReceipt1"] =
						exports['qb-target']:AddBoxZone("GabzBMReceipt1", vec3(-1402.88, -602.62, 30.32), 0.6, 0.6, { name="GabzBMReceipt1", heading = 140.33, debugPoly=Config.Debug, minZ = 30.3, maxZ = 30.8, },
							{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = v.job,
										img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/1/10/VanillaUnicorn-GTAV-Logo.png/ width=225px></p>" },
										{ event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].targetinfo["open_bossmenu"], job = bossroles, },
										{ type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = v.job },
									}, distance = 2.0 })
					Targets["GabzBMReceipt2"] =
						exports['qb-target']:AddBoxZone("GabzBMReceipt2", vec3(-1383.87, -592.4, 30.32), 0.6, 0.6, { name="GabzBMReceipt2", heading = 30.0, debugPoly=Config.Debug, minZ = 30.3, maxZ = 30.8, },
							{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = v.job,
										img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/1/10/VanillaUnicorn-GTAV-Logo.png/ width=225px></p>" },
										{ event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].targetinfo["open_bossmenu"], job = bossroles, },
										{ type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = v.job },
									}, distance = 2.0 })
					Targets["GabzBMReceipt3"] =
						exports['qb-target']:AddBoxZone("GabzBMReceipt3", vec3(-1398.81, -600.07, 30.32), 0.6, 0.6, { name="GabzBMReceipt3", heading = 287.83, debugPoly=Config.Debug, minZ = 30.3, maxZ = 30.8, },
							{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = v.job,
										img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/1/10/VanillaUnicorn-GTAV-Logo.png/ width=225px></p>" },
										{ event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].targetinfo["open_bossmenu"], job = bossroles, },
										{ type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = v.job },
									}, distance = 2.0 })

				--Shops--
					Targets["GabzBMFridge"] =
						exports['qb-target']:AddBoxZone("GabzBMFridge", vec3(-1404.13, -598.73, 30.32-1), 1.4, 0.6, { name="GabzBMFridge", heading = 303.0, debugPoly=Config.Debug, minZ=29.32, maxZ=30.32 },
							{ options = { {  event = "jim-vanillaunicorn:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["open_drink_fridge"], job = v.job, shop = Config.DrinkItems, shopname = "UniDrinkfrige" }, }, distance = 1.5 })

					Targets["GabzBMFridge2"] =
						exports['qb-target']:AddBoxZone("GabzBMFridge2", vec3(-1401.9, -597.28, 30.32-1), 1.4, 0.6, { name="GabzBMFridge2", heading = 303.0, debugPoly=Config.Debug, minZ=29.32, maxZ=30.32 },
							{ options = { {  event = "jim-vanillaunicorn:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["open_food_fridge"],"Open Food Fridge", job = v.job, shop = Config.FoodItems, shopname = "UniFoodfrige" }, }, distance = 2.0 })

				--Stashes--
					Targets["GabzBMPrepared"] =
						exports['qb-target']:AddBoxZone("GabzBMPrepared", vec3(-1400.38, -597.28, 30.32-1), 0.8, 0.8, { name="GabzBMPrepared", heading = 302.0, debugPoly=Config.Debug, minZ = 29.37, maxZ = 30.97, },
							{ options = { {  event = "jim-vanillaunicorn:Stash", icon = "fas fa-box-open", label = "Prepared Food", stash = "BMStorage", job = v.job }, }, distance = 1.0 })

				--Trays--
					Targets["GabzBMCounter"] =
						exports['qb-target']:AddBoxZone("GabzBMCounter", vec3(-1398.84, -601.0, 31.40-1), 0.5, 0.7, { name="GabzBMCounter", heading = 77.96, debugPoly=Config.Debug, minZ = 30.0, maxZ = 31.00, },
							{ options = { { event = "jim-vanillaunicorn:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_counter"], stash = "BahaCounter" }, }, distance = 2.0 })

					Targets["GabzBMCounter2"] =
						exports['qb-target']:AddBoxZone("GabzBMCounter2", vec3(-1402.22, -602.92, 31.40-1), 0.5, 0.7, { name="GabzBMCounter2", heading = 332.25, debugPoly=Config.Debug, minZ = 30.0, maxZ = 31.00, },
							{ options = { { event = "jim-vanillaunicorn:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].targetinfo["open_counter"], stash = "BahaCounter2" }, }, distance = 2.0 })

				--Drinks--
					Targets["GabzBMCocktails"] =
						exports['qb-target']:AddBoxZone("GabzBMCocktails", vec3(-1403.47, -601.91, 30.32), 0.4, 0.5, { name="GabzBMCocktails", heading = 305.0, debugPoly=Config.Debug, minZ=30.12, maxZ=30.72 },
							{ options = { { event = "jim-vanillaunicorn:Crafting", icon = "fas fa-cocktail", label = Loc[Config.Lan].targetinfo["prepare_cocktails"], job = v.job, craftable = Crafting.Cocktails, header = Loc[Config.Lan].menu["cocktail"], coords = vec3(-1403.47, -601.91, 30.32)
						}, }, distance = 2.0 })

					Targets["GabzBMTAP"] =
						exports['qb-target']:AddBoxZone("GabzBMTAP", vec3(-1399.93, -598.1, 30.32), 1.4, 0.6, { name="GabzBMTAP", heading = 30.0, debugPoly=Config.Debug, minZ = 29.27, maxZ = 29.87, },
							{ options = { { event = "jim-vanillaunicorn:Crafting", icon = "fas fa-beer", label = Loc[Config.Lan].targetinfo["pour_beer"], job = v.job, craftable = Crafting.Beer, header = Loc[Config.Lan].menu["beer"], coords = vec3(-1403.47, -601.91, 30.32)
						}, }, distance = 1.5 })

				--Food--
					Targets["GabzBMOven"] =
						exports['qb-target']:AddBoxZone("GabzBMOven", vec3(-1403.8, -598.65, 31.40-1), 0.4, 0.7, { name="GabzBMOven", heading = 33.0, debugPoly=Config.Debug, minZ = 30.30, maxZ = 31.00, },
							{ options = { { event = "jim-vanillaunicorn:Crafting", icon = "fas fa-temperature-high", label = Loc[Config.Lan].targetinfo["use_oven"], job = v.job, craftable = Crafting.Food, header = Loc[Config.Lan].menu["oven"], coords = vec3(-1403.47, -601.91, 30.32)
						}, }, distance = 2.0 })

					Targets["GabzBMBOSS"] =
						exports['qb-target']:AddBoxZone("GabzBMBoss", vec3(-1370.19, -625.8, 30.36-1), 0.6, 0.6, { name="GabzBMBOSS", heading = 32.0, debugPoly=Config.Debug, minZ = 29.0, maxZ = 30.0, },
							{ options = { { event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].targetinfo["open_bossmenu"], job = bossroles, }, }, distance = 2.0 })


				--WashHands--
					Targets["GabzBMSink"] =
					exports['qb-target']:AddBoxZone("GabzBMSink", vec3(-1388.23, -604.21, 30.32-0.5), 0.6, 0.6, { name="GabzBMSink", heading = 210.3, debugPoly=Config.Debug, minZ = 29.0, maxZ = 30.8, },
						{ options = { { event = "jim-vanillaunicorn:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], coords = -1388.23, -604.21, 30.32,}, }, distance = 1.5 })
					Targets["GabzBMSink2"] =
						exports['qb-target']:AddBoxZone("GabzBMSink2", vec3(-1387.44, -603.68, 30.32-0.5), 0.6, 0.6, { name="GabzBMSink2", heading = 210.3, debugPoly=Config.Debug, minZ = 29.0, maxZ = 30.8, },
							{ options = { { event = "jim-vanillaunicorn:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], coords = vec3(-1387.44, -603.68, 30.32),}, }, distance = 1.5 })
					Targets["GabzBMSink3"] =
						exports['qb-target']:AddBoxZone("GabzBMSink3", vec3(-1386.65, -603.2, 30.32-0.5), 0.6, 0.6, { name="GabzBMSink3", heading = 210.3, debugPoly=Config.Debug,minZ = 29.0, maxZ = 30.8, },
							{ options = { { event = "jim-vanillaunicorn:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], coords = vec3(-1386.65, -603.2, 30.32),}, }, distance = 1.5 })

				--Urinals--
					Targets["GabzBMUrinal1"] =
						exports['qb-target']:AddBoxZone("GabzBMUrinal1", vec3(-1389.65, -596.9, 30.32-0.5), 2.2, 0.4, { name="GabzBMUrinal1", heading = 123.0, debugPoly=Config.Debug, minZ = 29.0, maxZ = 30.8, },
							{ options = { { event = "jim-vanillaunicorn:useToilet", icon = "fas fa-toilet", label = "Use Toilet", coords = vec3(-1389.65, -596.9, 30.32-0.5), urinal = true, }, }, distance = 2.0})
					Targets["GabzBMUrinal2"] =
						exports['qb-target']:AddBoxZone("GabzBMUrinal2", vec3(-1391.69, -598.13, 30.32-0.5), 2.2, 0.4, { name="GabzBMUrinal2", heading = 123.0, debugPoly=Config.Debug, minZ = 29.0, maxZ = 30.8, },
							{ options = { { event = "jim-vanillaunicorn:useToilet", icon = "fas fa-toilet", label = "Use Toilet", coords = vec3(-1391.69, -598.13, 30.32-0.5), urinal = true, }, }, distance = 2.0})

					for k, a in pairs(Toilets.GabzBM) do
						Targets["GabzBMToilets"..k] =
							exports['qb-target']:AddBoxZone("GabzBMToilets"..k, vec3(a.coords.x, a.coords.y, a.coords.z-0.5), 0.6, 0.6, { name="GabzBMToilets"..k, heading = 123, debugPoly=Config.Debug, minZ = 29.0, maxZ = 30.8, },
								{ options = { { event = "jim-vanillaunicorn:useToilet", icon = "fas fa-toilet", label = "Use Toilet", coords = a.coords.xyz, sitcoords = a.coords},}, distance = 2.0})
					end


					for s, a in pairs(jacuzzilist) do Jacuzzis = CircleZone:Create(a.coords.xyz, 1.25, { name = "jacuzzi"..s, debugPoly = Config.Debug})
						Jacuzzis:onPlayerInOut(function(isPointInside, point, zone)
							if isPointInside then inJacuzzi = true
								CreateThread(function()
									while inJacuzzi do Wait(5000) TriggerServerEvent('hud:server:RelieveStress', Config.JacuzzisStress) end Wait(100)
								end)
							else inJacuzzi = false
							end
						end)
					end
				--Model Hides--
					CreateModelHide(vec3(-1401.03, -597.51, 30.32), 0.2, `prop_bar_fridge_03`, true)
				-- Prop Changes --
					local proptable = {
						{ prop = "v_res_fh_coftablea", coords = vec4(-1407.26, -609.67, 30.68, 123.68) }, { prop = "v_res_fh_coftablea", coords = vec4(-1403.72, -615.13, 30.68, 123.68) },
						{ prop = "v_res_fh_coftablea", coords = vec4(-1405.37, -612.42, 30.68, 123.68) }, { prop = "v_res_fh_coftablea", coords = vec4(-1402.08, -618.03, 30.68, 123.68) },
						{ prop = "v_res_r_silvrtray", coords = vec4(-1398.84, -601.0, 31.40, 77.96) }, { prop = "v_res_r_silvrtray", coords = vec4(-1402.22, -602.92, 31.40, 332.5) },
						{ prop = "v_med_cor_minifridge", coords = vec4(-1400.38, -597.28, 30.32, 302.5) }, { prop = "prop_griddle_02", coords = vec4(-1403.8, -598.65, 31.40, 33.44) },
					}
					for _, prop in pairs(proptable) do Props[#Props+1] = makeProp(prop, true, false) end
				end)
			end
		end
	end
end)

Tables = {
	GabzBM = {
		vec3(-1383.54, -628.78, 30.32), vec3(-1381.37, -627.41, 30.32),	vec3(-1385.62, -630.15, 30.32),	vec3(-1395.26, -628.09, 30.32),
		vec3(-1395.88, -627.16, 30.32),	vec3(-1397.21, -625.23, 30.32),	vec3(-1398.07, -623.85, 30.32),	vec3(-1399.18, -622.07, 30.32),
		vec3(-1399.88, -620.7, 30.32), vec3(-1410.27, -604.52, 30.5), vec3(-1408.15, -603.11, 30.32), vec3(-1406.2, -601.82, 30.32),
		vec3(-1397.56, -596.07, 30.32), vec3(-1395.74, -594.85, 30.32), vec3(-1393.93, -593.61, 30.32), vec3(-1387.54, -607.1, 30.32),
		vec3(-1386.58, -608.62, 30.32), vec3(-1381.61, -616.26, 30.32), vec3(-1380.64, -617.78, 30.32),
	},
}

Toilets = {
	GabzBM = {
		{ coords = vec4(-1384.56, -597.19, 29.82, 120.0) },
		{ coords = vec4(-1383.6, -598.54, 29.82, 120.0) },
		{ coords = vec4(-1382.63, -600.04, 29.82, 120.0) }
	},
}

RegisterNetEvent('jim-vanillaunicorn:Door', function(data)
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do Wait(10) end
	local c = { [1] = vec4(132.41, -1287.36, 29.27, 30.0), [2] = vec4(138.62, -1293.34, 29.23, 210.0), }
	SetEntityCoords(Ped, c[data.door].x, c[data.door].y, c[data.door].z, 0, 0, 0, false) SetEntityHeading(Ped, c[data.door].w)
	DoScreenFadeIn(1000)
    Wait(100)
end)

RegisterNetEvent('jim-vanillaunicorn:useToilet', function(data)
	lookEnt(data.coords)
	if data.urinal then
		if progressBar({ label = "Using Toilet", time = 5000, cancel = true, dict = "misscarsteal2peeing", anim = "peeing_loop", flag = 8 }) then
			TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] - math.random(10,30))
			TriggerServerEvent("consumables:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + math.random(10,30))
		else
			TriggerEvent('inventory:client:busy:status', false)
			triggerNotify(nil, Loc[Config.Lan].error["cancelled"], 'error')
		end
	else
		TaskStartScenarioAtPosition(Ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", data.sitcoords.x, data.sitcoords.y, data.sitcoords.z, data.sitcoords.w, 0, 1, true)
		if progressBar({ label = "Using Toilet", time = 10000, cancel = true }) then
			TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] - math.random(10,30))
			TriggerServerEvent("consumables:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] - math.random(10,30))
			ClearPedTasks(ped)
		else
			TriggerEvent('inventory:client:busy:status', false)
			triggerNotify(nil, Loc[Config.Lan].error["cancelled"], 'error')
		end
	end
end)

RegisterNetEvent('jim-vanillaunicorn:washHands', function(data)
	lookEnt(data.coords)
	local cam = createTempCam(PlayerPedId(), data.coords)
	if progressBar({ label = Loc[Config.Lan].progressbar["washing_hands"], time = 5000, cancel = true, dict = "mp_arresting", anim = "a_uncuff", flag = 32, icon = data.item, cam = cam }) then
		triggerNotify(nil, Loc[Config.Lan].success["have_washed_hands"], "success")
	else
		triggerNotify(nil, Loc[Config.Lan].error["cancelled"], 'error')
	end
	ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent('jim-vanillaunicorn:Stash', function(data)
	if data.job and not jobCheck() then return end
	if Config.Inv == "ox" then exports.ox_inventory:openInventory('stash', data.stash)
	else TriggerEvent("inventory:client:SetCurrentStash", data.stash)
	TriggerServerEvent("inventory:server:OpenInventory", "stash", data.stash) end
	lookEnt(data.coords)
end)

RegisterNetEvent('jim-vanillaunicorn:Shop', function(data)
	if not jobCheck() then return end
	local event = "inventory:server:OpenInventory"
	if Config.JimShop then event = "jim-shops:ShopOpen"
	elseif Config.Inv == "ox" then exports.ox_inventory:openInventory('shop', { type = data.shopname }) end
	TriggerServerEvent(event, "shop", "vanillaunicorn", data.shop)
	lookEnt(data.coords)
end)

--[[CRAFTING]]--
RegisterNetEvent('jim-vanillaunicorn:Crafting:MakeItem', function(data)
	if not CraftLock then CraftLock = true else return end
	local cam = createTempCam(PlayerPedId(), data.coords)
	local bartime = 5000
	if data.header == Loc[Config.Lan].menu["beer"] or data.header == Loc[Config.Lan].menu["coffee"] then
		bartext = Loc[Config.Lan].progress["pouring"] bartime = 3000 animDictNow = "mp_ped_interaction" animNow = "handshake_guy_a"
	elseif data.header == Loc[Config.Lan].menu["oven"] then
		bartext = Loc[Config.Lan].progress["cooking"] bartime = 5000 animDictNow = "amb@prop_human_bbq@male@base" animNow = "base"
	elseif data.header == Loc[Config.Lan].menu["cocktail"] then
		bartext = Loc[Config.Lan].progress["mixing"] bartime = 7000
		animDictNow = "anim@heists@prison_heiststation@cop_reactions"
		animNow = "cop_b_idle"
	end
	if (data.amount and data.amount ~= 1) then data.craft["amount"] = data.amount
		for k in pairs(data.craft[data.item]) do data.craft[data.item][k] *= data.amount end
		bartime *= data.amount bartime *= 0.9
	end

	local cam = createTempCam(PlayerPedId(), data.coords)
	CreateThread(function() while CraftLock do playAnim(animDictNow, animNow, bartime, 32) Wait(GetAnimDuration(animDictNow, animNow)*1000) end stopAnim(animDictNow, animNow) end)
	if progressBar({ label = bartext..QBCore.Shared.Items[data.item].label, time = bartime, cancel = true, icon = data.item, cam = cam }) then
		CraftLock = false
		TriggerServerEvent('jim-vanillaunicorn:Crafting:GetItem', data.item, data.craft)
		Wait(500)
		TriggerEvent("jim-vanillaunicorn:Crafting", data)
	else
		CraftLock = false
	end
end)

RegisterNetEvent('jim-vanillaunicorn:Crafting', function(data)
	if CraftLock then return end
	if not jobCheck() then return end
	local Menu = {}
	if Config.Menu == "qb" then
		Menu[#Menu + 1] = { header = data.header, txt = "", isMenuHeader = true }
		Menu[#Menu + 1] = { icon = "fas fa-circle-xmark", header = "", txt = Loc[Config.Lan].menu["close"], params = { event = "" } }
	end
	for i = 1, #data.craftable do
		for k, v in pairs(data.craftable[i]) do
			if not QBCore.Shared.Items[k] then print("^5Debug^7: ^2Item not found in server^7: '^6"..k.."^7'") else
				if k ~= "amount" then
					local canShow, disable, setheader, settext, checktable = true, false, "", "", {}
					for l, b in pairs(data.craftable[i][tostring(k)]) do
						if not QBCore.Shared.Items[l] then
							print("^5Debug^7: ^3Ingredient Item^2 not found in server^7: '^6"..l.."^7'") canShow = false
						else
							settext = settext..QBCore.Shared.Items[l].label..(b > 1 and " x"..b or "")..(Config.Menu == "ox" and "\n" or "<br>")
							checktable[l] = HasItem(l, b)
						end
					end
					if canShow then
						for _, v in pairs(checktable) do if v == false then disable = true break end end
						setheader = QBCore.Shared.Items[k].label..(not disable and " ✔️" or "")
						local event = "jim-vanillaunicorn:Crafting:MakeItem"
						if Config.MultiCraft then event = "jim-vanillaunicorn:Crafting:MultiCraft" end
						Menu[#Menu + 1] = {
							disabled = disable,
							icon = "nui://"..Config.img..QBCore.Shared.Items[tostring(k)].image,
							header = setheader, txt = settext, --qb-menu
							params = { event = event, args = { item = k, craft = data.craftable[i], craftable = data.craftable, header = data.header, coords = data.coords } }, -- qb-menu
							title = setheader, description = settext, -- ox_lib
							event = event, args = { item = k, craft = data.craftable[i], craftable = data.craftable, header = data.header, coords = data.coords }, -- ox_lib
						}
					end
				end
			end
		end
	end
	if Config.Menu == "ox" then exports.ox_lib:registerContext({id = 'Crafting', title = data.header, position = 'top-right', options = Menu }) exports.ox_lib:showContext("Crafting")
	elseif Config.Menu == "qb" then exports['qb-menu']:openMenu(Menu) end
	lookEnt(data.coords)
end)

RegisterNetEvent('jim-vanillaunicorn:Crafting:MultiCraft', function(data)
    local success = Config.MultiCraftAmounts local Menu = {}
    for k in pairs(success) do success[k] = true
        for l, b in pairs(data.craft[data.item]) do
            local has = HasItem(l, (b * k)) if not has then success[k] = false break else success[k] = true end
		end
	end
    if Config.Menu == "qb" then Menu[#Menu + 1] = { header = data.header, txt = "", isMenuHeader = true } end
	Menu[#Menu + 1] = { icon = "fas fa-arrow-left", title = Loc[Config.Lan].menu["back"], header = "", txt = Loc[Config.Lan].menu["back"], params = { event = "jim-vanillaunicorn:Crafting", args = data }, event = "jim-vanillaunicorn:Crafting", args = data }
	for k in pairsByKeys(success) do
		Menu[#Menu + 1] = {
			disabled = not success[k],
			icon = "nui://"..Config.img..QBCore.Shared.Items[data.item].image, header = QBCore.Shared.Items[data.item].label.." [x"..k.."]", title = QBCore.Shared.Items[data.item].label.." [x"..k.."]",
			event = "jim-vanillaunicorn:Crafting:MakeItem", args = { item = data.item, craft = data.craft, craftable = data.craftable, header = data.header, anim = data.anim, amount = k, coords = data.coords },
			params = { event = "jim-vanillaunicorn:Crafting:MakeItem", args = { item = data.item, craft = data.craft, craftable = data.craftable, header = data.header, anim = data.anim, amount = k, coords = data.coords } }
		}
	end
	if Config.Menu == "ox" then exports.ox_lib:registerContext({id = 'Crafting', title = data.header, position = 'top-right', options = Menu })	exports.ox_lib:showContext("Crafting")
	elseif Config.Menu == "qb" then exports['qb-menu']:openMenu(Menu) end
end)

local function ConsumeSuccess(itemName, type)
    ExecuteCommand("e c")
    toggleItem(false, itemName, 1)
	local change = { thirst = QBCore.Shared.Items[itemName].thirst, hunger = QBCore.Shared.Items[itemName].hunger }
    if change.hunger then
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + change.hunger)
        TriggerServerEvent("consumables:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + change.hunger)
    end
    if change.thirst then
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + change.thirst)
        TriggerServerEvent("consumables:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + change.thirst)
    end
    if type == "alcohol" then alcoholCount += 1
        if alcoholCount > 1 and alcoholCount < 4 then TriggerEvent("evidence:client:SetStatus", "alcohol", 200) elseif alcoholCount >= 4 then TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200) AlienEffect() end
    end
    if Config.RewardItem == itemName then toggleItem(true, Config.RewardPool[math.random(1, #Config.RewardPool)], 1) end
end

RegisterNetEvent('jim-vanillaunicorn:client:Consume', function(itemName, type)
	local emoteTable = {
		--Beers
		["ambeer"] = "beer3", ["dusche"] = "beer1", ["logger"] = "beer2", ["pisswasser"] = "beer4", ["pisswasser2"] = "beer5", ["pisswasser3"] = "beer6",
		--Cocktails
		["amarettosour"] = "whiskey", ["bellini"] = "whiskey", ["bloodymary"] = "whiskey", ["longisland"] = "whiskey", 	["margarita"] = "whiskey", ["pinacolada"] = "whiskey", ["sangria"] = "whiskey", ["screwdriver"] = "whiskey", ["strawdaquiri"] = "whiskey", ["strawmargarita"] = "whiskey",
		--Spirits
		["rum"] = "rumb", ["gin"] = "ginb",	["vodka"] = "vodkab",
		--Drinks
		["sprunk"] = "sprunk", ["sprunklight"] = "sprunk",
		["ecola"] = "ecola", ["ecolalight"] = "ecola",
		["cranberry"] = "wine", ["wine"] = "pinejuice",
		["coffee"] = "coffee",
		--Food
		["crisps"] = "crisps",
	}
	local progstring, defaultemote = Loc[Config.Lan].progress["drinking"], "drink"
	if type == "food" then progstring = Loc[Config.Lan].progress["eating"] defaultemote = "burger" end
	ExecuteCommand("e "..(emoteTable[itemName] or defaultemote))
	if progressBar({label = progstring..QBCore.Shared.Items[itemName].label.."..", time = math.random(3000, 6000), cancel = true, icon = itemName}) then
		ConsumeSuccess(itemName, type)
	else
		ExecuteCommand("e c")
	end
end)

AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
	if GetResourceState("qb-target") == "started" or GetResourceState("ox_target") == "started" then
		for k in pairs(Targets) do exports['qb-target']:RemoveZone(k) end
		for _, v in pairs(Props) do unloadModel(GetEntityModel(v)) DeleteEntity(v) end
	end
end)

CreateThread(function()
	while Config.DisableMusic do
		Wait(100)
		if NetworkIsSessionStarted() then
			SetStaticEmitterEnabled('LOS_SANTOS_VANILLA_UNICORN_01_STAGE', false)
			SetStaticEmitterEnabled('LOS_SANTOS_VANILLA_UNICORN_02_MAIN_ROOM', false)
			SetStaticEmitterEnabled('LOS_SANTOS_VANILLA_UNICORN_03_BACK_ROOM', false)
			return
		end
	end
end)