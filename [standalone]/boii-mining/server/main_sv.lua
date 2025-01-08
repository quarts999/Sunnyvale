----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local PhoneEvent = Config.CoreSettings.PhoneEvent
local RemoveStress = Config.CoreSettings.RemoveStressEvent
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--

--<!>-- ADD/REMOVE ITEM EVENTS START --<!>--
-- Remove item event
RegisterServerEvent('boii-mining:sv:RemoveItem', function(itemremove, amount)
    local source = source
    local pData = Core.Functions.GetPlayer(source)
    if pData.Functions.RemoveItem(itemremove, tonumber(amount)) then
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[itemremove], 'remove', amount)
    end
end)
-- Add item event
RegisterServerEvent('boii-mining:sv:AddItem', function(itemadd, amount)
    local source = source
    local pData = Core.Functions.GetPlayer(source)
    if pData.Functions.AddItem(itemadd, tonumber(amount)) then
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[itemadd], 'add', amount)
    end
end)
--<!>-- ADD/REMOVE ITEM EVENTS END --<!>--

--<!>-- TAKE GUIDE --<!>--
RegisterServerEvent('boii-mining:sv:TakeGuide', function()
    local src = source
    local pData = Core.Functions.GetPlayer(src)
    if pData.Functions.GetItemByName('miningguide') ~= nil then TriggerClientEvent('boii-mining:notify', src, Language.Mining.Quarry.Ped['hasguide'], 'error') return end
    pData.Functions.AddItem('miningguide', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['miningguide'], 'add', 1)
    TriggerClientEvent('boii-mining:notify', src, Language.Mining.Quarry.Ped['guide'], 'success')
end)
--<!>-- TAKE GUIDE --<!>--