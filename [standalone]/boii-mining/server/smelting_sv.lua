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

--<!>-- SMELTING --<!>--
RegisterServerEvent('boii-mining:sv:Smelt', function(reward, amount)
    local src = source
    local pData = Core.Functions.GetPlayer(src)
    local MiningXP = pData.PlayerData.metadata[MetaDataName]
    if Config.Smelting.CanFail then
        if (Config.Smelting.Chance >= math.random(1,100)) then
            if Config.XP.Use then
                pData.Functions.SetMetaData(MetaDataName, (MiningXP - math.random(2, 6))) -- Edit xp remove here
                TriggerClientEvent('boii-mining:notify', src, Language.Mining.Smelting['failxp'], 'error')
            else
                TriggerClientEvent('boii-mining:notify', src, Language.Mining.Smelting['fail'], 'error')
            end
        else
            pData.Functions.AddItem(reward, amount)
            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[reward], 'add', amount)
            if Config.XP.Use then
                pData.Functions.SetMetaData(MetaDataName, (MiningXP + math.random(2, 6))) -- Edit xp reward here
                TriggerClientEvent('boii-mining:notify', src, Language.Mining.Smelting['successxp'], 'success')
            else
                TriggerClientEvent('boii-mining:notify', src, Language.Mining.Smelting['success'], 'success')
            end
        end
    else
        pData.Functions.AddItem(reward, amount)
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[reward], 'add', amount)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (MiningXP + math.random(2, 6))) -- Edit xp reward here
            TriggerClientEvent('boii-mining:notify', src, Language.Mining.Smelting['successxp'], 'success')
        else
            TriggerClientEvent('boii-mining:notify', src, Language.Mining.Smelting['success'], 'success')
        end
    end
end)
--<!>-- SMELTING --<!>--