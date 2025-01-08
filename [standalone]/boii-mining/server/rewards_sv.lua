----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local MetaDataEvent = Config.CoreSettings.MetaDataEvent
local MetaDataName = Config.XP.MetaDataName
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--

--<!>-- DIG PAYDIRT --<!>--
RegisterServerEvent('boii-mining:sv:DigPaydirt', function()
    local src = source
    local pData = Core.Functions.GetPlayer(src)
    local MiningXP = pData.PlayerData.metadata[MetaDataName]
    pData.Functions.RemoveItem(Config.Paydirt.Dirt.Required[2].name, 1)
    pData.Functions.AddItem(Config.Paydirt.Dirt.Return.name, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[Config.Paydirt.Dirt.Required[2].name], 'remove', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[Config.Paydirt.Dirt.Return.name], 'add', 1)
    if Config.XP.Use then
        pData.Functions.SetMetaData(MetaDataName, (MiningXP + math.random(2, 6))) -- Edit xp reward here
        TriggerClientEvent('boii-mining:notify', src, Language.Mining.Quarry.Paydirt.Digging['successxp'], 'success')
    else
        TriggerClientEvent('boii-mining:notify', src, Language.Mining.Quarry.Paydirt.Digging['success'], 'success')
    end
    if Config.Paydirt.Dirt.BreakTool then
        if (Config.Paydirt.Dirt.Chance >= math.random(1, 100)) then
            pData.Functions.RemoveItem(Config.Paydirt.Dirt.Required[1].name, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[Config.Paydirt.Dirt.Required[1].name], 'remove', 1)
            TriggerClientEvent('boii-mining:notify', src, Language.Mining.Quarry.Paydirt.Digging['fail'], 'error')
        end
    end
end)
--<!>-- DIG PAYDIRT --<!>--

--<!>-- PAN PAYDIRT --<!>--
RegisterServerEvent('boii-mining:sv:PanPaydirt', function()
    local src = source
    local pData = Core.Functions.GetPlayer(src)
    local MiningXP = pData.PlayerData.metadata[MetaDataName]
    local regularreward = Config.Paydirt.Panning.Return.Regular[math.random(1, #Config.Paydirt.Panning.Return.Regular)]
    local regularreward2 = Config.Paydirt.Panning.Return.Regular[math.random(1, #Config.Paydirt.Panning.Return.Regular)]
    local highreward = Config.Paydirt.Panning.Return.Regular[math.random(1, #Config.Paydirt.Panning.Return.High)]
    if (20 >= math.random(1,100)) then
        pData.Functions.AddItem(highreward, math.random(1,2))
        pData.Functions.AddItem(regularreward2, math.random(1,3))
        pData.Functions.AddItem(regularreward, math.random(1,3))
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[highreward], 'add', math.random(1,3))
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[regularreward2], 'add', math.random(1,3))
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[regularreward], 'add', math.random(1,3))
    elseif (40 >= math.random(1,100)) then
        pData.Functions.AddItem(regularreward2, math.random(1,2))
        pData.Functions.AddItem(regularreward, math.random(1,2))
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[regularreward2], 'add', math.random(1,2))
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[regularreward], 'add', math.random(1,2))
    elseif (80 >= math.random(1,100)) then
        pData.Functions.AddItem(regularreward, math.random(1,2))
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[regularreward], 'add', math.random(1,2))
    else
        TriggerClientEvent('boii-mining:notify', src, Language.Mining.Quarry.Paydirt.Panning['fail'], 'error')
        return
    end 
    if Config.XP.Use then
        pData.Functions.SetMetaData(MetaDataName, (MiningXP + math.random(2, 6))) -- Edit xp reward here
        TriggerClientEvent('boii-mining:notify', src, Language.Mining.Quarry.Paydirt.Panning['successxp'], 'success')
    else
        TriggerClientEvent('boii-mining:notify', src, Language.Mining.Quarry.Paydirt.Panning['success'], 'success')
    end
    pData.Functions.RemoveItem(Config.Paydirt.Dirt.Return.name, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[Config.Paydirt.Dirt.Return.name], 'remove', 1)
end)
--<!>-- PAN PAYDIRT --<!>--

--<!>-- QUARRY DRILLING --<!>--
RegisterServerEvent('boii-mining:sv:QuarryDrilling', function()
    local src = source
    local pData = Core.Functions.GetPlayer(src)
    local MiningXP = pData.PlayerData.metadata[MetaDataName]
    local regularreward = Config.Quarry.Drilling.Return.Regular[math.random(1, #Config.Quarry.Drilling.Return.Regular)]
    local regularreward2 = Config.Quarry.Drilling.Return.Regular[math.random(1, #Config.Quarry.Drilling.Return.Regular)]
    local highreward = Config.Quarry.Drilling.Return.Regular[math.random(1, #Config.Quarry.Drilling.Return.High)]
    if (20 >= math.random(1,100)) then
        pData.Functions.AddItem(highreward, math.random(3,5))
        pData.Functions.AddItem(regularreward2, math.random(3,7))
        pData.Functions.AddItem(regularreward, math.random(3,7))
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[highreward], 'add', math.random(3,5))
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[regularreward2], 'add', math.random(3,7))
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[regularreward], 'add', math.random(3,7))
    elseif (40 >= math.random(1,100)) then
        pData.Functions.AddItem(regularreward2, math.random(2,5))
        pData.Functions.AddItem(regularreward, math.random(2,5))
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[regularreward2], 'add', math.random(3,7))
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[regularreward], 'add', math.random(3,7))
    elseif (80 >= math.random(1,100)) then
        pData.Functions.AddItem(regularreward, math.random(1,2))
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[regularreward], 'add', math.random(3,7))
    else
        TriggerClientEvent('boii-mining:notify', src, Language.Mining.Quarry.Drilling['fail'], 'error')
        if Config.Quarry.Drilling.BreakTool then
            if (Config.Quarry.Drilling.Chance >= math.random(1, 100)) then
                pData.Functions.RemoveItem(Config.Quarry.Drilling.Required.name, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[Config.Quarry.Drilling.Required.name], 'remove', 1)
                TriggerClientEvent('boii-mining:notify', src, Language.Mining.Quarry.Drilling['failbreak'], 'error')
            end
        end
        return
    end 
    if Config.XP.Use then
        pData.Functions.SetMetaData(MetaDataName, (MiningXP + math.random(4, 8))) -- Edit xp reward here
        TriggerClientEvent('boii-mining:notify', src, Language.Mining.Quarry.Drilling['successxp'], 'success')
    else
        TriggerClientEvent('boii-mining:notify', src, Language.Mining.Quarry.Drilling['success'], 'success')
    end
end)
--<!>-- QUARRY DRILLING --<!>--

--<!>-- KAMBI CAVE DRILLING --<!>--
RegisterServerEvent('boii-mining:sv:CaveDrilling', function()
    local src = source
    local pData = Core.Functions.GetPlayer(src)
    local MiningXP = pData.PlayerData.metadata[MetaDataName]
    local regularreward = Config.Quarry.Drilling.Return.Regular[math.random(1, #Config.Quarry.Drilling.Return.Regular)]
    local regularreward2 = Config.Quarry.Drilling.Return.Regular[math.random(1, #Config.Quarry.Drilling.Return.Regular)]
    local regularreward3 = Config.Quarry.Drilling.Return.Regular[math.random(1, #Config.Quarry.Drilling.Return.Regular)]
    local highreward = Config.Quarry.Drilling.Return.Regular[math.random(1, #Config.Quarry.Drilling.Return.High)]
    if (10 >= math.random(1,100)) then
        pData.Functions.AddItem(highreward, math.random(3,5))
        pData.Functions.AddItem(regularreward3, math.random(2,6))
        pData.Functions.AddItem(regularreward2, math.random(3,7))
        pData.Functions.AddItem(regularreward, math.random(3,7))
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[highreward], 'add', math.random(3,5))
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[regularreward3], 'add', math.random(2,6))
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[regularreward2], 'add', math.random(3,7))
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[regularreward], 'add', math.random(3,7))
    elseif (35 >= math.random(1,100)) then
        pData.Functions.AddItem(highreward, math.random(2,4))
        pData.Functions.AddItem(regularreward2, math.random(2,5))
        pData.Functions.AddItem(regularreward, math.random(2,6))
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[highreward], 'add', math.random(2,4))
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[regularreward2], 'add', math.random(2,5))
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[regularreward], 'add', math.random(2,6))
    elseif (50 >= math.random(1,100)) then
        pData.Functions.AddItem(regularreward3, math.random(1,4))
        pData.Functions.AddItem(regularreward2, math.random(2,4))
        pData.Functions.AddItem(regularreward, math.random(2,4))
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[regularreward2], 'add', math.random(1,4))
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[regularreward2], 'add', math.random(2,4))
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[regularreward], 'add', math.random(2,4))
    elseif (80 >= math.random(1,100)) then
        pData.Functions.AddItem(regularreward2, math.random(2,5))
        pData.Functions.AddItem(regularreward, math.random(2,5))
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[regularreward2], 'add', math.random(2,5))
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[regularreward], 'add', math.random(2,5))
    else
        TriggerClientEvent('boii-mining:notify', src, Language.Mining.Quarry.Drilling['fail'], 'error')
        if Config.Quarry.Drilling.BreakTool then
            if (Config.Quarry.Drilling.Chance >= math.random(1, 100)) then
                pData.Functions.RemoveItem(Config.Quarry.Drilling.Required.name, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[Config.Quarry.Drilling.Required.name], 'remove', 1)
                TriggerClientEvent('boii-mining:notify', src, Language.Mining.Quarry.Drilling['failbreak'], 'error')
            end
        end
        return
    end 
    if Config.XP.Use then
        pData.Functions.SetMetaData(MetaDataName, (MiningXP + math.random(4, 8))) -- Edit xp reward here
        TriggerClientEvent('boii-mining:notify', src, Language.Mining.Quarry.Drilling['successxp'], 'success')
    else
        TriggerClientEvent('boii-mining:notify', src, Language.Mining.Quarry.Drilling['success'], 'success')
    end
end)
--<!>-- KAMBI CAVE DRILLING --<!>--