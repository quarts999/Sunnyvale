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
        header = Language.Mining.Smelting.Menu.Main['header'],
        txt = Language.Mining.Smelting.Menu.Main['text'],
        icon = Language.Mining.Smelting.Menu.Main['icon'],
        isMenuHeader = true
    },
    {
        header = Language.Mining.Smelting.Menu.Ingots.Main['header'],
        txt = Language.Mining.Smelting.Menu.Ingots.Main['text'],
        icon = Language.Mining.Smelting.Menu.Ingots.Main['icon'],
        params = {
            event = 'boii-mining:cl:SmeltingIngotsMenu'
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

-- Ingots
local Ingots = {
    {
        header = Language.Mining.Smelting.Menu.Ingots.Main['header'],
        txt = Language.Mining.Smelting.Menu.Ingots.Main['text'],
        icon = Language.Mining.Smelting.Menu.Ingots.Main['icon'],
        isMenuHeader = true
    },
    {
        header = Language.Mining.Smelting.Menu.Ingots.Aluminum['header'],
        txt = Language.Mining.Smelting.Menu.Ingots.Aluminum['text'],
        icon = Language.Mining.Smelting.Menu.Ingots.Aluminum['icon'],
        params = {
            event = 'boii-mining:cl:Smelt',
            args = {
                timer = Config.Smelting.Ingots.Aluminum.Time,
                x2items = false, -- Toggle use of 2 items to smelt; refer to bronze/steel for example
                req = Config.Smelting.Ingots.Aluminum.Required.name,
                reqamount = Config.Smelting.Ingots.Aluminum.Required.amount,
                req2 = '', -- Not required unless using 2 items; refer to bronze/steel for example
                reqamount2 = '', -- Not required unless using 2 items; refer to bronze/steel for example
                reward = Config.Smelting.Ingots.Aluminum.Return.name,
                rewardamount = Config.Smelting.Ingots.Aluminum.Return.amount
            }
        }
    },
    {
        header = Language.Mining.Smelting.Menu.Ingots.Copper['header'],
        txt = Language.Mining.Smelting.Menu.Ingots.Copper['text'],
        icon = Language.Mining.Smelting.Menu.Ingots.Copper['icon'],
        params = {
            event = 'boii-mining:cl:Smelt',
            args = {
                timer = Config.Smelting.Ingots.Copper.Time,
                x2items = false,
                req = Config.Smelting.Ingots.Copper.Required.name,
                reqamount = Config.Smelting.Ingots.Copper.Required.amount,
                req2 = '',
                reqamount2 = '',
                reward = Config.Smelting.Ingots.Copper.Return.name,
                rewardamount = Config.Smelting.Ingots.Copper.Return.amount
            }
        }
    },
    {
        header = Language.Mining.Smelting.Menu.Ingots.Iron['header'],
        txt = Language.Mining.Smelting.Menu.Ingots.Iron['text'],
        icon = Language.Mining.Smelting.Menu.Ingots.Iron['icon'],
        params = {
            event = 'boii-mining:cl:Smelt',
            args = {
                timer = Config.Smelting.Ingots.Iron.Time,
                x2items = false,
                req = Config.Smelting.Ingots.Iron.Required.name,
                reqamount = Config.Smelting.Ingots.Iron.Required.amount,
                req2 = '',
                reqamount2 = '',
                reward = Config.Smelting.Ingots.Iron.Return.name,
                rewardamount = Config.Smelting.Ingots.Iron.Return.amount
            }
        }
    },
    {
        header = Language.Mining.Smelting.Menu.Ingots.Tin['header'],
        txt = Language.Mining.Smelting.Menu.Ingots.Tin['text'],
        icon = Language.Mining.Smelting.Menu.Ingots.Tin['icon'],
        params = {
            event = 'boii-mining:cl:Smelt',
            args = {
                timer = Config.Smelting.Ingots.Tin.Time,
                x2items = false,
                req = Config.Smelting.Ingots.Tin.Required.name,
                reqamount = Config.Smelting.Ingots.Tin.Required.amount,
                req2 = '',
                reqamount2 = '',
                reward = Config.Smelting.Ingots.Tin.Return.name,
                rewardamount = Config.Smelting.Ingots.Tin.Return.amount
            }
        }
    },
    {
        header = Language.Mining.Smelting.Menu.Ingots.Gold['header'],
        txt = Language.Mining.Smelting.Menu.Ingots.Gold['text'],
        icon = Language.Mining.Smelting.Menu.Ingots.Gold['icon'],
        params = {
            event = 'boii-mining:cl:Smelt',
            args = {
                timer = Config.Smelting.Ingots.Gold.Time,
                x2items = false,
                req = Config.Smelting.Ingots.Gold.Required.name,
                reqamount = Config.Smelting.Ingots.Gold.Required.amount,
                req2 = '',
                reqamount2 = '',
                reward = Config.Smelting.Ingots.Gold.Return.name,
                rewardamount = Config.Smelting.Ingots.Gold.Return.amount
            }
        }
    },
    {
        header = Language.Mining.Smelting.Menu.Ingots.Silver['header'],
        txt = Language.Mining.Smelting.Menu.Ingots.Silver['text'],
        icon = Language.Mining.Smelting.Menu.Ingots.Silver['icon'],
        params = {
            event = 'boii-mining:cl:Smelt',
            args = {
                timer = Config.Smelting.Ingots.Silver.Time,
                x2items = false,
                req = Config.Smelting.Ingots.Silver.Required.name,
                reqamount = Config.Smelting.Ingots.Silver.Required.amount,
                req2 = '',
                reqamount2 = '',
                reward = Config.Smelting.Ingots.Silver.Return.name,
                rewardamount = Config.Smelting.Ingots.Silver.Return.amount
            }
        }
    },
    {
        header = Language.Mining.Smelting.Menu.Ingots.Cobalt['header'],
        txt = Language.Mining.Smelting.Menu.Ingots.Cobalt['text'],
        icon = Language.Mining.Smelting.Menu.Ingots.Cobalt['icon'],
        params = {
            event = 'boii-mining:cl:Smelt',
            args = {
                timer = Config.Smelting.Ingots.Cobalt.Time,
                x2items = false,
                req = Config.Smelting.Ingots.Cobalt.Required.name,
                reqamount = Config.Smelting.Ingots.Cobalt.Required.amount,
                req2 = '',
                reqamount2 = '',
                reward = Config.Smelting.Ingots.Cobalt.Return.name,
                rewardamount = Config.Smelting.Ingots.Cobalt.Return.amount
            }
        }
    },
    {
        header = Language.Mining.Smelting.Menu.Ingots.Bronze['header'],
        txt = Language.Mining.Smelting.Menu.Ingots.Bronze['text'],
        icon = Language.Mining.Smelting.Menu.Ingots.Bronze['icon'],
        params = {
            event = 'boii-mining:cl:Smelt',
            args = {
                timer = Config.Smelting.Ingots.Bronze.Time,
                x2items = true,
                req = Config.Smelting.Ingots.Bronze.Required[1].name,
                reqamount = Config.Smelting.Ingots.Bronze.Required[1].amount,
                req2 = Config.Smelting.Ingots.Bronze.Required[2].name,
                reqamount2 = Config.Smelting.Ingots.Bronze.Required[2].amount,
                reward = Config.Smelting.Ingots.Bronze.Return.name,
                rewardamount = Config.Smelting.Ingots.Bronze.Return.amount
            }
        }
    },
    {
        header = Language.Mining.Smelting.Menu.Ingots.Steel['header'],
        txt = Language.Mining.Smelting.Menu.Ingots.Steel['text'],
        icon = Language.Mining.Smelting.Menu.Ingots.Steel['icon'],
        params = {
            event = 'boii-mining:cl:Smelt',
            args = {
                timer = Config.Smelting.Ingots.Steel.Time,
                x2items = true,
                req = Config.Smelting.Ingots.Steel.Required[1].name,
                reqamount = Config.Smelting.Ingots.Steel.Required[1].amount,
                req2 = Config.Smelting.Ingots.Steel.Required[2].name,
                reqamount2 = Config.Smelting.Ingots.Steel.Required[2].amount,
                reward = Config.Smelting.Ingots.Steel.Return.name,
                rewardamount = Config.Smelting.Ingots.Steel.Return.amount
            }
        }
    },
    {
        header = Language.Shared['returnmenu'],
        icon = Language.Shared['returnmenuicon'],
        params = {
            event = 'boii-mining:cl:SmeltingMenu'
        }
    }
}

-- Event
RegisterNetEvent('boii-mining:cl:SmeltingMenu', function()
    exports[MenuName]:openMenu(MainMenu)
end)

-- Sub menu events
RegisterNetEvent('boii-mining:cl:SmeltingIngotsMenu', function()
    exports[MenuName]:openMenu(Ingots)
end)