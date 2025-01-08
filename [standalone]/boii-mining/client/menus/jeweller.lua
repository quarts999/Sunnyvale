----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local MenuName = Config.CoreSettings.MenuName
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

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
        header = Language.Mining.Warehouse.Menu.Builders.Main['header'],
        txt = Language.Mining.Warehouse.Menu.Builders.Main['text'],
        icon = Language.Mining.Warehouse.Menu.Builders.Main['icon'],
        isMenuHeader = true
    },
    {
        header = Language.Mining.Warehouse.Menu.Sell.Main['header'],
        txt = Language.Mining.Warehouse.Menu.Sell.Main['text'],
        icon = Language.Mining.Warehouse.Menu.Sell.Main['icon'],
        params = {
            event = 'boii-mining:cl:WarehouseSellMenu',
        }
    },
    {
        header = Language.Shared['exitmenu'],
        icon = Language.Shared['exitmenuicon'],
        params = {
            event = 'boii-mining:cl:StopMenu'
        }
    },
}

-- Main menu sql
local MainMenuSQL = {
    {
        header = Language.Mining.Warehouse.Menu.Jewellers.Main['header'],
        txt = Language.Mining.Warehouse.Menu.Jewellers.Main['text'],
        icon = Language.Mining.Warehouse.Menu.Jewellers.Main['icon'],
        isMenuHeader = true
    },
    {
        header = Language.Mining.Warehouse.Menu.Sell.Main['header'],
        txt = Language.Mining.Warehouse.Menu.Sell.Main['text'],
        icon = Language.Mining.Warehouse.Menu.Sell.Main['icon'],
        params = {
            event = 'boii-mining:cl:JewellerySellMenu',
        }
    },
    {
        header = Language.Mining.Warehouse.Menu.Buy.Main['header'],
        txt = Language.Mining.Warehouse.Menu.Buy.Main['text'],
        icon = Language.Mining.Warehouse.Menu.Buy.Main['icon'],
        params = {
            event = 'boii-mining:cl:JewelleryBuyMenu',
        }
    },
    {
        header = Language.Shared['exitmenu'],
        icon = Language.Shared['exitmenuicon'],
        params = {
            event = 'boii-mining:cl:StopMenu'
        }
    },
}

-- Selling menu
local Sell = {
    {
        header = Language.Mining.Warehouse.Menu.Sell.Main['header'],
        txt = Language.Mining.Warehouse.Menu.Sell.Main['text'],
        icon = Language.Mining.Warehouse.Menu.Sell.Main['icon'],
        isMenuHeader = true
    },
    {
        header = Language.Mining.Warehouse.Menu.Sell.Gems['header'],
        txt = Language.Mining.Warehouse.Menu.Sell.Gems['text'],
        icon = Language.Mining.Warehouse.Menu.Sell.Gems['icon'],
        params = {
            event = 'boii-mining:cl:JewellerySellGems',
        }
    },
    {
        header = Language.Shared['returnmenu'],
        icon = Language.Shared['returnmenuicon'],
        params = {
            event = 'boii-mining:cl:JewelleryMenu'
        }
    }
}

-- Selling gems menu
local SellGems = {
    {
        header = Language.Mining.Warehouse.Menu.Sell.Gems['header'],
        txt = Language.Mining.Warehouse.Menu.Sell.Gems['text'],
        icon = Language.Mining.Warehouse.Menu.Sell.Gems['icon'],
        isMenuHeader = true
    },
    {
        header = Config.Warehouse.Items.Gems['amethyst'].label,
        txt = 'Price: $'..Config.Warehouse.Items.Gems['amethyst'].price,
        icon = Language.Mining.Warehouse.Menu.Sell.Gems['icon'],
        params = {
            event = 'boii-mining:sv:SellItems',
            isServer = true,
            args = {
                store = 'Jeweller',
                item = Config.Warehouse.Items.Gems['amethyst'].item,
                label = Config.Warehouse.Items.Gems['amethyst'].label,
                price = Config.Warehouse.Items.Gems['amethyst'].price
            }
        }
    },
    {
        header = Config.Warehouse.Items.Gems['citrine'].label,
        txt = 'Price: $'..Config.Warehouse.Items.Gems['citrine'].price,
        icon = Language.Mining.Warehouse.Menu.Sell.Gems['icon'],
        params = {
            event = 'boii-mining:sv:SellItems',
            isServer = true,
            args = {
                store = 'Jeweller',
                item = Config.Warehouse.Items.Gems['citrine'].item,
                label = Config.Warehouse.Items.Gems['citrine'].label,
                price = Config.Warehouse.Items.Gems['citrine'].price
            }
        }
    },
    {
        header = Config.Warehouse.Items.Gems['hematite'].label,
        txt = 'Price: $'..Config.Warehouse.Items.Gems['hematite'].price,
        icon = Language.Mining.Warehouse.Menu.Sell.Gems['icon'],
        params = {
            event = 'boii-mining:sv:SellItems',
            isServer = true,
            args = {
                store = 'Jeweller',
                item = Config.Warehouse.Items.Gems['hematite'].item,
                label = Config.Warehouse.Items.Gems['hematite'].label,
                price = Config.Warehouse.Items.Gems['hematite'].price
            }
        }
    },
    {
        header = Config.Warehouse.Items.Gems['kyanite'].label,
        txt = 'Price: $'..Config.Warehouse.Items.Gems['kyanite'].price,
        icon = Language.Mining.Warehouse.Menu.Sell.Gems['icon'],
        params = {
            event = 'boii-mining:sv:SellItems',
            isServer = true,
            args = {
                store = 'Jeweller',
                item = Config.Warehouse.Items.Gems['kyanite'].item,
                label = Config.Warehouse.Items.Gems['kyanite'].label,
                price = Config.Warehouse.Items.Gems['kyanite'].price
            }
        }
    },
    {
        header = Config.Warehouse.Items.Gems['onyx'].label,
        txt = 'Price: $'..Config.Warehouse.Items.Gems['onyx'].price,
        icon = Language.Mining.Warehouse.Menu.Sell.Gems['icon'],
        params = {
            event = 'boii-mining:sv:SellItems',
            isServer = true,
            args = {
                store = 'Jeweller',
                item = Config.Warehouse.Items.Gems['onyx'].item,
                label = Config.Warehouse.Items.Gems['onyx'].label,
                price = Config.Warehouse.Items.Gems['onyx'].price
            }
        }
    },
    {
        header = Config.Warehouse.Items.Gems['diamond'].label,
        txt = 'Price: $'..Config.Warehouse.Items.Gems['diamond'].price,
        icon = Language.Mining.Warehouse.Menu.Sell.Gems['icon'],
        params = {
            event = 'boii-mining:sv:SellItems',
            isServer = true,
            args = {
                store = 'Jeweller',
                item = Config.Warehouse.Items.Gems['diamond'].item,
                label = Config.Warehouse.Items.Gems['diamond'].label,
                price = Config.Warehouse.Items.Gems['diamond'].price
            }
        }
    },
    {
        header = Config.Warehouse.Items.Gems['emerald'].label,
        txt = 'Price: $'..Config.Warehouse.Items.Gems['emerald'].price,
        icon = Language.Mining.Warehouse.Menu.Sell.Gems['icon'],
        params = {
            event = 'boii-mining:sv:SellItems',
            isServer = true,
            args = {
                store = 'Jeweller',
                item = Config.Warehouse.Items.Gems['emerald'].item,
                label = Config.Warehouse.Items.Gems['emerald'].label,
                price = Config.Warehouse.Items.Gems['emerald'].price
            }
        }
    },
    {
        header = Config.Warehouse.Items.Gems['ruby'].label,
        txt = 'Price: $'..Config.Warehouse.Items.Gems['ruby'].price,
        icon = Language.Mining.Warehouse.Menu.Sell.Gems['icon'],
        params = {
            event = 'boii-mining:sv:SellItems',
            isServer = true,
            args = {
                store = 'Jeweller',
                item = Config.Warehouse.Items.Gems['ruby'].item,
                label = Config.Warehouse.Items.Gems['ruby'].label,
                price = Config.Warehouse.Items.Gems['ruby'].price
            }
        }
    },
    {
        header = Config.Warehouse.Items.Gems['sapphire'].label,
        txt = 'Price: $'..Config.Warehouse.Items.Gems['sapphire'].price,
        icon = Language.Mining.Warehouse.Menu.Sell.Gems['icon'],
        params = {
            event = 'boii-mining:sv:SellItems',
            isServer = true,
            args = {
                store = 'Jeweller',
                item = Config.Warehouse.Items.Gems['sapphire'].item,
                label = Config.Warehouse.Items.Gems['sapphire'].label,
                price = Config.Warehouse.Items.Gems['sapphire'].price
            }
        }
    },
    {
        header = Config.Warehouse.Items.Gems['tanzanite'].label,
        txt = 'Price: $'..Config.Warehouse.Items.Gems['tanzanite'].price,
        icon = Language.Mining.Warehouse.Menu.Sell.Gems['icon'],
        params = {
            event = 'boii-mining:sv:SellItems',
            isServer = true,
            args = {
                store = 'Jeweller',
                item = Config.Warehouse.Items.Gems['tanzanite'].item,
                label = Config.Warehouse.Items.Gems['tanzanite'].label,
                price = Config.Warehouse.Items.Gems['tanzanite'].price
            }
        }
    },
    {
        header = Language.Shared['returnmenu'],
        icon = Language.Shared['returnmenuicon'],
        params = {
            event = 'boii-mining:cl:JewellerySellMenu'
        }
    }
}

-- Buying menu
local Buy = {
    {
        header = Language.Mining.Warehouse.Menu.Buy.Main['header'],
        txt = Language.Mining.Warehouse.Menu.Buy.Main['text'],
        icon = Language.Mining.Warehouse.Menu.Buy.Main['icon'],
        isMenuHeader = true
    },
    {
        header = Language.Mining.Warehouse.Menu.Buy.Gems['header'],
        txt = Language.Mining.Warehouse.Menu.Buy.Gems['text'],
        icon = Language.Mining.Warehouse.Menu.Buy.Gems['icon'],
        params = {
            event = 'boii-mining:cl:JewelleryBuyGems',
        }
    },
    {
        header = Language.Shared['returnmenu'],
        icon = Language.Shared['returnmenuicon'],
        params = {
            event = 'boii-mining:cl:JewelleryMenu'
        }
    }
}

-- Buy gems menu
local BuyGems = {
    {
        header = Language.Mining.Warehouse.Menu.Buy.Gems['header'],
        txt = Language.Mining.Warehouse.Menu.Buy.Gems['text'],
        icon = Language.Mining.Warehouse.Menu.Buy.Gems['icon'],
        isMenuHeader = true
    },
    {
        header = Config.Warehouse.Items.Gems['amethyst'].label,
        txt = 'Price: $'..math.ceil(Config.Warehouse.Items.Gems['amethyst'].price*Config.Warehouse.Items.Gems['amethyst'].buymultiplier),
        icon = Language.Mining.Warehouse.Menu.Buy.Gems['icon'],
        params = {
            event = 'boii-mining:cl:BuyItems',
            args = {
                store = 'Jeweller',
                item = Config.Warehouse.Items.Gems['amethyst'].item,
                label = Config.Warehouse.Items.Gems['amethyst'].label,
                price = Config.Warehouse.Items.Gems['amethyst'].price,
                buymultiplier = Config.Warehouse.Items.Gems['amethyst'].buymultiplier
            }
        }
    },
    {
        header = Config.Warehouse.Items.Gems['citrine'].label,
        txt = 'Price: $'..math.ceil(Config.Warehouse.Items.Gems['citrine'].price*Config.Warehouse.Items.Gems['citrine'].buymultiplier),
        icon = Language.Mining.Warehouse.Menu.Buy.Gems['icon'],
        params = {
            event = 'boii-mining:cl:BuyItems',
            args = {
                store = 'Jeweller',
                item = Config.Warehouse.Items.Gems['citrine'].item,
                label = Config.Warehouse.Items.Gems['citrine'].label,
                price = Config.Warehouse.Items.Gems['citrine'].price,
                buymultiplier = Config.Warehouse.Items.Gems['citrine'].buymultiplier
            }
        }
    },
    {
        header = Config.Warehouse.Items.Gems['hematite'].label,
        txt = 'Price: $'..math.ceil(Config.Warehouse.Items.Gems['hematite'].price*Config.Warehouse.Items.Gems['hematite'].buymultiplier),
        icon = Language.Mining.Warehouse.Menu.Buy.Gems['icon'],
        params = {
            event = 'boii-mining:cl:BuyItems',
            args = {
                store = 'Jeweller',
                item = Config.Warehouse.Items.Gems['hematite'].item,
                label = Config.Warehouse.Items.Gems['hematite'].label,
                price = Config.Warehouse.Items.Gems['hematite'].price,
                buymultiplier = Config.Warehouse.Items.Gems['hematite'].buymultiplier
            }
        }
    },
    {
        header = Config.Warehouse.Items.Gems['kyanite'].label,
        txt = 'Price: $'..math.ceil(Config.Warehouse.Items.Gems['kyanite'].price*Config.Warehouse.Items.Gems['kyanite'].buymultiplier),
        icon = Language.Mining.Warehouse.Menu.Buy.Gems['icon'],
        params = {
            event = 'boii-mining:cl:BuyItems',
            args = {
                store = 'Jeweller',
                item = Config.Warehouse.Items.Gems['kyanite'].item,
                label = Config.Warehouse.Items.Gems['kyanite'].label,
                price = Config.Warehouse.Items.Gems['kyanite'].price,
                buymultiplier = Config.Warehouse.Items.Gems['kyanite'].buymultiplier
            }
        }
    },
    {
        header = Config.Warehouse.Items.Gems['onyx'].label,
        txt = 'Price: $'..math.ceil(Config.Warehouse.Items.Gems['onyx'].price*Config.Warehouse.Items.Gems['onyx'].buymultiplier),
        icon = Language.Mining.Warehouse.Menu.Buy.Gems['icon'],
        params = {
            event = 'boii-mining:cl:BuyItems',
            args = {
                store = 'Jeweller',
                item = Config.Warehouse.Items.Gems['onyx'].item,
                label = Config.Warehouse.Items.Gems['onyx'].label,
                price = Config.Warehouse.Items.Gems['onyx'].price,
                buymultiplier = Config.Warehouse.Items.Gems['onyx'].buymultiplier
            }
        }
    },
    {
        header = Config.Warehouse.Items.Gems['diamond'].label,
        txt = 'Price: $'..math.ceil(Config.Warehouse.Items.Gems['diamond'].price*Config.Warehouse.Items.Gems['diamond'].buymultiplier),
        icon = Language.Mining.Warehouse.Menu.Buy.Gems['icon'],
        params = {
            event = 'boii-mining:cl:BuyItems',
            args = {
                store = 'Jeweller',
                item = Config.Warehouse.Items.Gems['diamond'].item,
                label = Config.Warehouse.Items.Gems['diamond'].label,
                price = Config.Warehouse.Items.Gems['diamond'].price,
                buymultiplier = Config.Warehouse.Items.Gems['diamond'].buymultiplier
            }
        }
    },
    {
        header = Config.Warehouse.Items.Gems['emerald'].label,
        txt = 'Price: $'..math.ceil(Config.Warehouse.Items.Gems['emerald'].price*Config.Warehouse.Items.Gems['emerald'].buymultiplier),
        icon = Language.Mining.Warehouse.Menu.Buy.Gems['icon'],
        params = {
            event = 'boii-mining:cl:BuyItems',
            args = {
                store = 'Jeweller',
                item = Config.Warehouse.Items.Gems['emerald'].item,
                label = Config.Warehouse.Items.Gems['emerald'].label,
                price = Config.Warehouse.Items.Gems['emerald'].price,
                buymultiplier = Config.Warehouse.Items.Gems['emerald'].buymultiplier
            }
        }
    },
    {
        header = Config.Warehouse.Items.Gems['ruby'].label,
        txt = 'Price: $'..math.ceil(Config.Warehouse.Items.Gems['ruby'].price*Config.Warehouse.Items.Gems['ruby'].buymultiplier),
        icon = Language.Mining.Warehouse.Menu.Buy.Gems['icon'],
        params = {
            event = 'boii-mining:cl:BuyItems',
            args = {
                store = 'Jeweller',
                item = Config.Warehouse.Items.Gems['ruby'].item,
                label = Config.Warehouse.Items.Gems['ruby'].label,
                price = Config.Warehouse.Items.Gems['ruby'].price,
                buymultiplier = Config.Warehouse.Items.Gems['ruby'].buymultiplier
            }
        }
    },
    {
        header = Config.Warehouse.Items.Gems['sapphire'].label,
        txt = 'Price: $'..math.ceil(Config.Warehouse.Items.Gems['sapphire'].price*Config.Warehouse.Items.Gems['sapphire'].buymultiplier),
        icon = Language.Mining.Warehouse.Menu.Buy.Gems['icon'],
        params = {
            event = 'boii-mining:cl:BuyItems',
            args = {
                store = 'Jeweller',
                item = Config.Warehouse.Items.Gems['sapphire'].item,
                label = Config.Warehouse.Items.Gems['sapphire'].label,
                price = Config.Warehouse.Items.Gems['sapphire'].price,
                buymultiplier = Config.Warehouse.Items.Gems['sapphire'].buymultiplier
            }
        }
    },
    {
        header = Config.Warehouse.Items.Gems['tanzanite'].label,
        txt = 'Price: $'..math.ceil(Config.Warehouse.Items.Gems['tanzanite'].price*Config.Warehouse.Items.Gems['tanzanite'].buymultiplier),
        icon = Language.Mining.Warehouse.Menu.Buy.Gems['icon'],
        params = {
            event = 'boii-mining:cl:BuyItems',
            args = {
                store = 'Jeweller',
                item = Config.Warehouse.Items.Gems['tanzanite'].item,
                label = Config.Warehouse.Items.Gems['tanzanite'].label,
                price = Config.Warehouse.Items.Gems['tanzanite'].price,
                buymultiplier = Config.Warehouse.Items.Gems['tanzanite'].buymultiplier
            }
        }
    },
    {
        header = Language.Shared['returnmenu'],
        icon = Language.Shared['returnmenuicon'],
        params = {
            event = 'boii-mining:cl:JewelleryBuyMenu'
        }
    }
}

-- Menu event
RegisterNetEvent('boii-mining:cl:JewelleryMenu', function()
    if Config.Warehouse.Jewellers.Times.Use then
        if GetClockHours() >= Config.Warehouse.Jewellers.Times.Open and GetClockHours() <= Config.Warehouse.Jewellers.Times.Close then
            if Config.Warehouse.UseSQL then
                exports[MenuName]:openMenu(MainMenuSQL)
            else
                exports[MenuName]:openMenu(MainMenu)
            end
        else 
            TriggerEvent('boii-mining:notify', Language.Mining.Warehouse.Menu.Jewellers['timer'], 'error')
        end
    else
        if Config.Warehouse.UseSQL then
            exports[MenuName]:openMenu(MainMenuSQL)
        else
            exports[MenuName]:openMenu(MainMenu)
        end
    end 
end)


-- Submenu events
RegisterNetEvent('boii-mining:cl:JewellerySellMenu', function()
    exports[MenuName]:openMenu(Sell)
end)

RegisterNetEvent('boii-mining:cl:JewellerySellGems', function()
    exports[MenuName]:openMenu(SellGems)
end)

RegisterNetEvent('boii-mining:cl:JewelleryBuyMenu', function()
    exports[MenuName]:openMenu(Buy)
end)

RegisterNetEvent('boii-mining:cl:JewelleryBuyGems', function()
    exports[MenuName]:openMenu(BuyGems)
end)