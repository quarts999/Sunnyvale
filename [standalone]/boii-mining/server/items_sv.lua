----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

--<!>-- GUIDE --<!>--
Core.Functions.CreateUseableItem('miningguide', function(source, item)
    TriggerClientEvent('boii-mining:cl:OpenGuide', source)
end)
--<!>-- GUIDE --<!>--

--<!>-- GOLD PAN --<!>--
Core.Functions.CreateUseableItem('gold_pan', function(source, item)
    local src = source
    local pData = Core.Functions.GetPlayer(src)
    if pData.Functions.GetItemByName(Config.Paydirt.Dirt.Return.name) == nil then TriggerClientEvent('boii-mining:notify', src, Language.Mining.Quarry.Paydirt.Panning['nopaydirt'], 'error') return end
    TriggerClientEvent('boii-mining:cl:PanPaydirt', src)
end)
--<!>-- GOLD PAN --<!>--