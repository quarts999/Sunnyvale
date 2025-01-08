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
        header = Language.Mining.Quarry.Ped.Menu.Main['header'],
        txt = Language.Mining.Quarry.Ped.Menu.Main['text'],
        icon = Language.Mining.Quarry.Ped.Menu.Main['icon'],
        isMenuHeader = true
    },
    {
        header = Language.Mining.Quarry.Ped.Menu.Guide['header'],
        txt = Language.Mining.Quarry.Ped.Menu.Guide['text'],
        icon = Language.Mining.Quarry.Ped.Menu.Guide['icon'],
        params = {
            event = 'boii-mining:sv:TakeGuide',
            isServer = true
        }
    },
    {
        header = Language.Mining.Quarry.Ped.Menu.Permits['header'],
        txt = Language.Mining.Quarry.Ped.Menu.Permits['text'],
        icon = Language.Mining.Quarry.Ped.Menu.Permits['icon'],
        params = {
            event = 'boii-mining:cl:QuarryPermitsMenu',
        }
    },
    {
        header = Language.Mining.Quarry.Ped.Menu.Equipment['header'],
        txt = Language.Mining.Quarry.Ped.Menu.Equipment['text'],
        icon = Language.Mining.Quarry.Ped.Menu.Equipment['icon'],
        params = {
            event = 'boii-mining:cl:QuarryEquipmentMenu',
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
        header = Language.Mining.Quarry.Ped.Menu.Permits['header'],
        txt = Language.Mining.Quarry.Ped.Menu.Permits['text'],
        icon = Language.Mining.Quarry.Ped.Menu.Permits['icon'],
        isMenuHeader = true
    },
    {
        header = Language.Mining.Quarry.Ped.Menu.Permits['miningheader'],
        txt = Language.Mining.Quarry.Ped.Menu.Permits['miningtext'],
        icon = Language.Mining.Quarry.Ped.Menu.Permits['miningicon'],
        params = {
            event = 'boii-mining:sv:PurchasePermit',
            isServer = true,
            args = {
                permit = 'Mining',
                item = Config.Stores.Permits.Mining.name,
                price = Config.Stores.Permits.Mining.price
            }
        }
    },
    {
        header = Language.Mining.Quarry.Ped.Menu.Permits['cavingheader'],
        txt = Language.Mining.Quarry.Ped.Menu.Permits['cavingtext'],
        icon = Language.Mining.Quarry.Ped.Menu.Permits['cavingicon'],
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
        header = Language.Mining.Quarry.Ped.Menu.Equipment['header'],
        txt = Language.Mining.Quarry.Ped.Menu.Equipment['text'],
        icon = Language.Mining.Quarry.Ped.Menu.Equipment['icon'],
        isMenuHeader = true
    },
    {
        header = Config.Paydirt.Dirt.Required[1].label,
        txt = 'Price: $'..Config.Paydirt.Dirt.Required[1].price,
        icon = Language.Mining.Quarry.Ped.Menu.Equipment['shovelicon'],
        params = {
            event = 'boii-mining:sv:PurchaseEquipment',
            isServer = true,
            args = {
                equipment = '',
                item = Config.Paydirt.Dirt.Required[1].name,
                price = Config.Paydirt.Dirt.Required[1].price
            }
        }
    },
    {
        header = Config.Paydirt.Dirt.Required[2].label,
        txt = 'Price: $'..Config.Paydirt.Dirt.Required[2].price,
        icon = Language.Mining.Quarry.Ped.Menu.Equipment['sackicon'],
        params = {
            event = 'boii-mining:sv:PurchaseEquipment',
            isServer = true,
            args = {
                equipment = '',
                item = Config.Paydirt.Dirt.Required[2].name,
                price = Config.Paydirt.Dirt.Required[2].price
            }
        }
    },
    {
        header = Config.Paydirt.Panning.Required.label,
        txt = 'Price: $'..Config.Paydirt.Panning.Required.price,
        icon = Language.Mining.Quarry.Ped.Menu.Equipment['sackicon'],
        params = {
            event = 'boii-mining:sv:PurchaseEquipment',
            isServer = true,
            args = {
                equipment = '',
                item = Config.Paydirt.Panning.Required.name,
                price = Config.Paydirt.Panning.Required.price
            }
        }
    },
    {
        header = Language.Mining.Quarry.Ped.Menu.Equipment['jackhammerheader'],
        txt = Language.Mining.Quarry.Ped.Menu.Equipment['jackhammertext'],
        icon = Language.Mining.Quarry.Ped.Menu.Equipment['jackhammericon'],
        params = {
            event = 'boii-mining:sv:PurchaseEquipment',
            isServer = true,
            args = {
                equipment = 'Jackhammer',
                item = Config.Quarry.Drilling.Required.name,
                price = Config.Quarry.Drilling.Required.price
            }
        }
    },
    {
        header = Language.Mining.Quarry.Ped.Menu.Equipment['dynamiteheader'],
        txt = Language.Mining.Quarry.Ped.Menu.Equipment['dynamitetext'],
        icon = Language.Mining.Quarry.Ped.Menu.Equipment['dynamiteicon'],
        params = {
            event = 'boii-mining:sv:PurchaseEquipment',
            isServer = true,
            args = {
                equipment = 'Dynamite',
                item = Config.Quarry.Dynamite.Required.name,
                price = Config.Quarry.Dynamite.Required.price
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
RegisterNetEvent('boii-mining:cl:QuarryMenu', function()
    if Config.Stores.Quarry.Times.Use then
        if GetClockHours() >= Config.Stores.Quarry.Times.Open and GetClockHours() <= Config.Stores.Quarry.Times.Close then
            exports[MenuName]:openMenu(MainMenu)
        else 
            TriggerEvent('boii-mining:notify', Language.Mining.Quarry.Ped['timer'], 'error')
        end
    else
        exports[MenuName]:openMenu(MainMenu)
    end 
end)

-- Sub menus events
RegisterNetEvent('boii-mining:cl:QuarryPermitsMenu', function()
    exports[MenuName]:openMenu(Permits)
end)

RegisterNetEvent('boii-mining:cl:QuarryEquipmentMenu', function()
    exports[MenuName]:openMenu(Equipment)
end)