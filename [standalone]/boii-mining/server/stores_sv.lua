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

--<!>-- PURCHASE PERMIT --<!>--
RegisterServerEvent('boii-mining:sv:PurchasePermit', function(args)
    local src = source
    local pData = Core.Functions.GetPlayer(src)
    local MiningXP = pData.PlayerData.metadata[MetaDataName]
    local moneytype = Config.Stores.Money.Type
    local qbmoney = pData.PlayerData.money[moneytype]
    if Config.XP.Use then
        if args.permit == 'Mining' then
            if MiningXP < 1250 then
                TriggerClientEvent('boii-mining:notify', src, Language.Mining.Stores.Permits['noxp'], 'error')
                TriggerClientEvent('boii-mining:cl:QuarryPermitsMenu', src)
                return
            end
        elseif args.permit == 'Caving' then
            if MiningXP < 2441 then
                TriggerClientEvent('boii-mining:notify', src, Language.Mining.Stores.Permits['noxp'], 'error')
                TriggerClientEvent('boii-mining:cl:QuarryPermitsMenu', src)
                return
            end
        end
    end
    if Config.Stores.Money.UseItem then
        if pData.Functions.GetItemByName(args.item) ~= nil then TriggerClientEvent('boii-mining:notify', src, Language.Mining.Stores['alreadyhaspermit'], 'error') return end
        if pData.Functions.GetItemByName(Config.Stores.Money.Item) ~= nil then 
            if pData.Functions.GetItemByName(Config.Stores.Money.Item).amount >= args.price then
                pData.Functions.RemoveItem(Config.Stores.Money.Item, args.price)
                pData.Functions.AddItem(args.item, 1)
                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[Config.Stores.Money.Item], 'remove', args.price)
                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[args.item], 'add', 1)
            else
                TriggerClientEvent('boii-mining:notify', src, Language.Mining.Stores['enoughmoney'], 'error')
            end
        else
            TriggerClientEvent('boii-mining:notify', src, Language.Mining.Stores['nomoney'], 'error')
        end
    else
        if qbmoney >= args.price then
            if pData.Functions.GetItemByName(args.item) ~= nil then TriggerClientEvent('boii-mining:notify', src, Language.Mining.Stores['alreadyhaspermit'], 'error') return end
            pData.Functions.RemoveMoney(moneytype, args.price, 'mining-store')
            pData.Functions.AddItem(args.item, 1)
            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[args.item], 'add', 1)
        else
            TriggerClientEvent('boii-mining:notify', src, Language.Mining.Stores['enoughmoney'], 'error')
        end
    end
    TriggerClientEvent('boii-mining:cl:QuarryPermitsMenu', src)
end)
--<!>-- PURCHASE PERMIT --<!>--

--<!>-- PURCHASE EQUIPMENT --<!>--
RegisterServerEvent('boii-mining:sv:PurchaseEquipment', function(args)
    local src = source
    local pData = Core.Functions.GetPlayer(src)
    local MiningXP = pData.PlayerData.metadata[MetaDataName]
    local moneytype = Config.Stores.Money.Type
    local qbmoney = pData.PlayerData.money[moneytype]
    if Config.XP.Use then
        if args.equipment == 'Jackhammer' then
            if MiningXP < 1250 then
                TriggerClientEvent('boii-mining:notify', src, Language.Mining.Stores.Equipment['noxp'], 'error')
                TriggerClientEvent('boii-mining:cl:QuarryEquipmentMenu', src)
                return
            end
        elseif args.equipment == 'Dynamite' then
            if MiningXP < 1250 then
                TriggerClientEvent('boii-mining:notify', src, Language.Mining.Stores.Equipment['noxp'], 'error')
                TriggerClientEvent('boii-mining:cl:QuarryEquipmentMenu', src)
                return
            end
        end
    end
    if Config.Stores.Money.UseItem then
        if pData.Functions.GetItemByName(Config.Stores.Money.Item) ~= nil then 
            if pData.Functions.GetItemByName(Config.Stores.Money.Item).amount >= args.price then
                pData.Functions.RemoveItem(Config.Stores.Money.Item, args.price)
                pData.Functions.AddItem(args.item, 1)
                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[Config.Stores.Money.Item], 'remove', args.price)
                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[args.item], 'add', 1)
            else
                TriggerClientEvent('boii-mining:notify', src, Language.Mining.Stores['enoughmoney'], 'error')
            end
        else
            TriggerClientEvent('boii-mining:notify', src, Language.Mining.Stores['nomoney'], 'error')
        end
    else
        if qbmoney >= args.price then
            pData.Functions.RemoveMoney(moneytype, args.price, 'mining-store')
            pData.Functions.AddItem(args.item, 1)
            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[args.item], 'add', 1)
        else
            TriggerClientEvent('boii-mining:notify', src, Language.Mining.Stores['enoughmoney'], 'error')
        end
    end
    TriggerClientEvent('boii-mining:cl:QuarryEquipmentMenu', src)
end)