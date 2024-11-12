# m-Backpacks script for QB-Core

| If you are intested in recieving updates join the community on **[Discord](https://discord.gg/svmzYehU8R)**! |

# About
- Optimized
- Many Features
- Full and easy customization
- 0.00ms

# Features
- 3 Backpacks : Small, Medium and Large
- Slots configurable.
- Weight configurable.
- You can only block for one gang.
- You can only block for one job.


# Required
**qb-core/shared/items.lua**
```
	['smallbackpack'] 			= {['name'] = 'smallbackpack', 			['label'] = 'Small Backpack',            	['weight'] = 250,     ['type'] = 'item',      ['image'] = 'smallbackpack.png',         	['unique'] = true,     ['useable'] = true,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = ''},
	['mediumbackpack'] 			= {['name'] = 'mediumbackpack', 		['label'] = 'Medium Backpack',            	['weight'] = 450,     ['type'] = 'item',      ['image'] = 'mediumbackpack.png',         	['unique'] = true,     ['useable'] = true,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = ''},
	['largebackpack'] 			= {['name'] = 'largebackpack', 			['label'] = 'Large Backpack',            	['weight'] = 650,     ['type'] = 'item',      ['image'] = 'largebackpack.png',         	['unique'] = true,     ['useable'] = true,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = ''},
```

**qb-inventory/server/main.lua**

## Search : **elseif QBCore.Shared.SplitStr(fromInventory, "-")[1] == "itemshop" then**

## And put like this: https://media.discordapp.net/attachments/1032610505552048148/1103064404297252966/image.png?width=1440&height=613

```
		elseif itemData.name == 'smallbackpack' then
         	local info = {
		        smallbackpackid = math.random(111,999),
		    }
        Player.Functions.AddItem('smallbackpack', 1, nil, info, {["quality"] = 100})

        elseif itemData.name == 'mediumbackpack' then
         	local info = {
		        mediumbackpackid = math.random(111,999),
		    }
        Player.Functions.AddItem('mediumbackpack', 1, nil, info, {["quality"] = 100})

        elseif itemData.name == 'largebackpack' then
         	local info = {
		        largebackpackid = math.random(111,999),
		    }
        Player.Functions.AddItem('largebackpack', 1, nil, info, {["quality"] = 100})

```

-- Jim-Shops

{ name = "smallbackpack", price = 250, amount = 50, info = {smallbackpackid = math.random(111111,999999)},},
{ name = "mediumbackpack", price = 250, amount = 50, info = {mediumbackpackid = math.random(111111,999999)},},
{ name = "largebackpack", price = 250, amount = 50, info = {largebackpackid = math.random(111111,999999)},},


**qs-inventory**

- qs-inventory/config/config_setInventory.lua

	if payment == 'cash' then
        if cash >= price then
            if itemData.name == "smallbackpack" then
                itemData.info = {smallbackpackid = math.random(111, 999)}
                Player.Functions.AddItem(itemData.name, 1, toSlot, itemData.info)
                xPlayer.Functions.RemoveMoney('cash', price)
                print("small")
            elseif itemData.name == "mediumbackpack" then
                itemData.info = {mediumbackpackid = math.random(111, 999)}
                Player.Functions.AddItem(itemData.name, 1, toSlot, itemData.info)
                xPlayer.Functions.RemoveMoney('cash', price)
            elseif itemData.name == "largebackpack" then
                itemData.info = {largebackpackid = math.random(111, 999)}
                Player.Functions.AddItem(itemData.name, 1, toSlot, itemData.info)
                xPlayer.Functions.RemoveMoney('cash', price)
            else
                if Player.Functions.AddItem(itemData.name, fromAmount, toSlot, itemData.info) then
                    xPlayer.Functions.RemoveMoney('cash', price)
                    if refresh then 
                        TriggerClientEvent('inventory:client:UpdatePlayerInventory', src)
                    end
                    TriggerClientEvent('qs-shops:client:UpdateShop', src, QBCore.Shared.SplitStr(shopType, "_")[2], itemData, fromAmount)
                    TriggerClientEvent("qs-inventory:sendMessage", src, "You bought " .. itemInfo.label, "success")
                    sendToDiscordShops(Config.WebhookTranslates["shop"]["title"], "**" .. GetPlayerName(src) .. Config.WebhookTranslates["shop"]["buy"] ..itemInfo["label"].. " x " ..fromAmount.. Config.WebhookTranslates["shop"]["cost"] ..price, 7393279)
                    --TriggerEvent('qs-inventory:sendWebhook', src, GetPlayerName(src)..Lang("LOGS_INFO_STORES")..itemInfo["label"]..Lang("LOGS_MONEY_STORES")..price..Lang("LOGS_GENERAL_INFO_2")..exports['qs-inventory']:GetProperty(src, "of the person"), Lang("LOGS_TITLE_STORES"), 7393279)
                else 
                    UpdateInventory(src)
                end
            end
        else
            TriggerClientEvent('inventory:client:UpdatePlayerInventory', src)
            TriggerClientEvent("qs-inventory:sendMessage", src, Lang("NO_MONEY"), 'error')
        end