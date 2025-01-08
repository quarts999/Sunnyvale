----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local MenuName = Config.CoreSettings.MenuName
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

-- Main menu
local MainMenu = {
    {
        header = Language.Mining.Mine.Ped.Menu.Main['header'],
        txt = Language.Mining.Mine.Ped.Menu.Main['text'],
        icon = Language.Mining.Mine.Ped.Menu.Main['icon'],
        isMenuHeader = true
    },
    {
        header = Language.Mining.Mine.Ped.Menu.Guide['header'],
        txt = Language.Mining.Mine.Ped.Menu.Guide['text'],
        icon = Language.Mining.Mine.Ped.Menu.Guide['icon'],
        params = {
            event = 'boii-mining:sv:TakeGuide',
            isServer = true
        }
    },
    {
        header = Language.Mining.Mine.Ped.Menu.Permits['header'],
        txt = Language.Mining.Mine.Ped.Menu.Permits['text'],
        icon = Language.Mining.Mine.Ped.Menu.Permits['icon'],
        params = {
            event = 'boii-mining:cl:MinePermitsMenu',
        }
    },
    {
        header = Language.Mining.Mine.Ped.Menu.Equipment['header'],
        txt = Language.Mining.Mine.Ped.Menu.Equipment['text'],
        icon = Language.Mining.Mine.Ped.Menu.Equipment['icon'],
        params = {
            event = 'boii-mining:cl:MineEquipmentMenu',
        }
    },
    {
        header = Language.Shared['exitmenu'],
        icon = Language.Shared['exitmenuicon'],
        params = {
            event = 'boii-mining:cl:StopMenu'
        }
    }
}

-- Permits menu
local Permits = {
    {
        header = Language.Mining.Mine.Ped.Menu.Permits['header'],
        txt = Language.Mining.Mine.Ped.Menu.Permits['text'],
        icon = Language.Mining.Mine.Ped.Menu.Permits['icon'],
        isMenuHeader = true
    },
    {
        header = Language.Mining.Mine.Ped.Menu.Permits['cavingheader'],
        txt = Language.Mining.Mine.Ped.Menu.Permits['cavingtext'],
        icon = Language.Mining.Mine.Ped.Menu.Permits['cavingicon'],
        params = {
            event = 'boii-mining:sv:PurchasePermit',
            isServer = true,
            args = {
                permit = 'Caving',
                item = Config.Stores.Permits.Caving.name,
                price = Config.Stores.Permits.Caving.price
            }
        }
    },
    {
        header = Language.Shared['returnmenu'],
        icon = Language.Shared['returnmenuicon'],
        params = {
            event = 'boii-mining:cl:QuarryMenu'
        }
    }
}

local Equipment = {
    {
        header = Language.Mining.Mine.Ped.Menu.Equipment['header'],
        txt = Language.Mining.Mine.Ped.Menu.Equipment['text'],
        icon = Language.Mining.Mine.Ped.Menu.Equipment['icon'],
        isMenuHeader = true
    },
    {
        header = Language.Mining.Mine.Ped.Menu.Equipment['jackhammerheader'],
        txt = Language.Mining.Mine.Ped.Menu.Equipment['jackhammertext'],
        icon = Language.Mining.Mine.Ped.Menu.Equipment['jackhammericon'],
        params = {
            event = 'boii-mining:sv:PurchaseEquipment',
            isServer = true,
            args = {
                equipment = 'Jackhammer',
                item = Config.Mine.Drilling.Required.name,
                price = Config.Mine.Drilling.Required.price
            }
        }
    },
    {
        header = Language.Mining.Mine.Ped.Menu.Equipment['dynamiteheader'],
        txt = Language.Mining.Mine.Ped.Menu.Equipment['dynamitetext'],
        icon = Language.Mining.Mine.Ped.Menu.Equipment['dynamiteicon'],
        params = {
            event = 'boii-mining:sv:PurchaseEquipment',
            isServer = true,
            args = {
                equipment = 'Dynamite',
                item = Config.Mine.Dynamite.Required.name,
                price = Config.Mine.Dynamite.Required.price
            }
        }
    },
    {
        header = Language.Shared['returnmenu'],
        icon = Language.Shared['returnmenuicon'],
        params = {
            event = 'boii-mining:cl:QuarryMenu'
        }
    }
}

-- Menu event
RegisterNetEvent('boii-mining:cl:MineMenu', function()
    if Config.Stores.Mine.Times.Use then
        if GetClockHours() >= Config.Stores.Mine.Times.Open and GetClockHours() <= Config.Stores.Mine.Times.Close then
            exports[MenuName]:openMenu(MainMenu)
        else 
            TriggerEvent('boii-mining:notify', Language.Mining.Mine.Ped['timer'], 'error')
        end
    else
        exports[MenuName]:openMenu(MainMenu)
    end 
end)

-- Sub menus events
RegisterNetEvent('boii-mining:cl:MinePermitsMenu', function()
    exports[MenuName]:openMenu(Permits)
end)

RegisterNetEvent('boii-mining:cl:MineEquipmentMenu', function()
    exports[MenuName]:openMenu(Equipment)
end)