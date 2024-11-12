# Pug fishing.
For any questions please contact me here: here https://discord.gg/jYZuWYjfvq.
For any of my other scripts you can purchase here: https://pug-scripts.tebex.io/category/2141020

--
# (BOTH FRAMEWORKS) Installation
Make sure you have the minigames installed found in the pug-fishing/minigame folder (JUST DRAG AND DROP THEM TO YOUR RESOURCE FOLDER AND MAKE SURE THEY ARE ENSURED).
Add all of the png's supplied in pug-fishing/(ESX-ONLY)or(QBCORE-ONLY)/images to your inventory.
Make sure you thoroughly read through the config and change everything to your liking!
/fishrep will show players there fishingrep
--

--
The way the script is setup is you are suppose to use the base fishing rod and then earn enough rep over time and find Skilled-rod and Pro-rod items while fishing
then take those items and craft the better fishing rods at Config.CrafingRodLocation with the required fishing rep and progress that way.
# (QBCORE ONLY) items adding to shops
Put the ["fishingrod"] and ["fishingbait"] in any of your shops.
--

--
# (ps-inventory ONLY) put this in ps-inventory/server/commands.lua where the /giveitem command is at around line 32 (looks like this: https://gyazo.com/ce46f3cb14ea581884507ae53867dc29)
elseif itemData["name"] == "fishinglure" then
    info.uses = 1000
elseif itemData["name"] == "fishinglure2" then
    info.uses = 1500

# (ps-inventory & PS-INVENTORY ONLY) -REPLACE THIS FUNCTION- in ps-inventory/server/functions.lua at around line 23
local function SetupShopItems(shopItems)
    local items = {}
    if shopItems and next(shopItems) then
        for _, item in pairs(shopItems) do
            local itemInfo = QBCore.Shared.Items[item.name:lower()]
            if item.name:lower() == "fishinglure" then
                item.info.uses = 1000
            elseif item.name:lower() == "fishinglure2" then 
                item.info.uses = 1500
            end
            if itemInfo then
                items[item.slot] = {
                    name = itemInfo['name'],
                    amount = tonumber(item.amount),
                    info = item.info or '',
                    label = itemInfo['label'],
                    description = itemInfo['description'] or '',
                    weight = itemInfo['weight'],
                    type = itemInfo['type'],
                    unique = itemInfo['unique'],
                    useable = itemInfo['useable'],
                    price = item.price,
                    image = itemInfo['image'],
                    slot = item.slot,
                }
            end
        end
    end
    return items
end

# (OLD ps-inventory ONLY) put this in ps-inventory/html/js/app.js at around line 396
case "fishinglure":
    return `<p><strong>Uses: </strong><span>${itemData.info.uses}</span></p>`;
case "fishinglure2":
    return `<p><strong>Uses: </strong><span>${itemData.info.uses}</span></p>`;
--

--
# (PS-INVENTORY ONLY) put this in ps-inventory/html/js/app.js at around line 630 under the markedbills (looks like this: https://gyazo.com/3fa6991e8784917cfda0c6ec9376e52d)
} else if (itemData.name == "fishinglure") {
    $(".item-info-title").html("<p>" + itemData.label + "</p>");
    $(".item-info-description").html(
        "<p><strong>Uses: </strong><span>" +
        itemData.info.uses +
        "</span></p><p style=\"font-size:11px\"><b>Weight: </b>" + itemData.weight + " | <b>Amount: </b> " + itemData.amount + " | <b>Quality: </b> " + "<a style=\"font-size:11px;color:green\">" + Math.floor(itemData.info.quality) + "</a>"
    );
} else if (itemData.name == "fishinglure2") {
    $(".item-info-title").html("<p>" + itemData.label + "</p>");
    $(".item-info-description").html(
        "<p><strong>Uses: </strong><span>" +
        itemData.info.uses +
        "</span></p><p style=\"font-size:11px\"><b>Weight: </b>" + itemData.weight + " | <b>Amount: </b> " + itemData.amount + " | <b>Quality: </b> " + "<a style=\"font-size:11px;color:green\">" + Math.floor(itemData.info.quality) + "</a>"
    );

# (PS-INVENTORY ONLY) put this in ps-inventory/server/main.lua where the /giveitem command is at around line 2409 under the harness. (looks like this https://gyazo.com/89360e5ab146413def3c2f0360510449)
elseif itemData["name"] == "fishinglure" then
    info.uses = 1000
elseif itemData["name"] == "fishinglure2" then
    info.uses = 1500
# (END OF QBCORE)

--
# (ESX ONLY) Installation
make sure you run the sql in pug-fishing/(ESX-ONLY-SQL)/FishingRep
--


# (ESX ONLY) Put this in ox_inventory/data/items.lua
['fishingrod'] = {
    label = 'Fishing Rod',
},
['fishingrod2'] = {
    label = 'Fishing Rod',
},
['fishingrod3'] = {
    label = 'Fishing Rod',
},
['fishinglure'] = {
    label = 'Fishing Lure',
    uses = 1000,
},
['fishinglure2'] = {
    label = 'Fishing Lure',
    uses = 1500,
},
['skill-reel'] = {
    label = 'Skilled Reel',
},
['pro-reel'] = {
    label = 'Pro Reel',
},
['fishingbait'] = {
    label = 'Fishing Bait',
},
['killerwhalemeat'] = {
    label = 'Killer whale',
},
['stingraymeat'] = {
    label = 'Stingray Meat',
},
['tigershark'] = {
    label = 'Tiger Shark',
},
['catfish'] = {
    label = 'Catfish',
},
['fish'] = {
    label = 'Fish',
},
['salmon'] = {
    label = 'Salmon',
},
['largemouthbass'] = {
    label = 'Largemouth Bass',
},
['goldfish'] = {
    label = 'Goldfish',
},
['redfish'] = {
    label = 'Redfish',
},
['bluefish'] = {
    label = 'Bluefish',
},
['stripedbass'] = {
    label = 'Striped Bass',
},
['rainbow-trout'] = {
    label = 'Rainbow Trout',
},
['gholfish'] = {
    label = 'Gholfish',
},
['codfish'] = {
    label = 'Codfish',
},
['eelfish'] = {
    label = 'Eelfish',
},
['swordfish'] = {
    label = 'Swordfish',
},
['tuna-fish'] = {
    label = 'Tunafish',
},
['chestkey'] = {
    label = 'Chest Key',
},
['treasurechest'] = {
    label = 'Treasure Chest',
},
['bottlemap'] = {
    label = 'Bottle',
},
['treasuremap'] = {
    label = 'Treasure Map',
},
['diamond'] = {
    label = 'Diamond',
},
['emerald'] = {
    label = 'Emerald',
},
['sapphire'] = {
    label = 'Sapphire',
},
['ruby'] = {
    label = 'Ruby',
},
['yellow-diamond'] = {
    label = 'Yellow Diamond',
},
['captainskull'] = {
    label = 'Captain Skull',
},
--

--
The way the script is setup is you are suppose to use the base fishing rod and then earn enough rep over time and find Skilled-rod and Pro-rod items while fishing
then take those items and craft the better fishing rods at Config.CrafingRodLocation with the required fishing rep and progress that way.
# (ESX ONLY) items adding to shops
There is a ["fishingrod"] and ["fishingbait"] shop event ["pug-fishing:client:OpenShop"] in open.lua for ox_inventory and esx users. This is already sertup by default.
You can add more shops for fishing using this event around your map.
--


--
# Pug fishing. For any questions please contact me here: here https://discord.gg/jYZuWYjfvq.

​Full QBCore & ESX Compatibility. (supports custom qb-core names and all qb custom file dependency names)

This script is partially locked using escrow encryption. Most of the script is accessable in client/open.lua, sv_open.lua, shared.lua and all html

PREVIEW HERE: https://youtu.be/iJnzHxUKRv0

This completely configurable script consist of:
● New world fishing minigame support.
● Very extensive config.lua with options to customize everything.
● Custom lang system to support multiple languages.
● 8 different massive loot tables depending on the rod or reel your using or if you are in a tournament or not.
● This script is partially locked using escrow encryption. Most of the script is accessible in client/open.lua, sv_open.lua, shared.lua and all html
● Custom tournament UI that updates live Displaying 1st, 2nd, and 3rd position and points of your competitors, your position, and your points.
● UI that updates live Displaying showing how much time until the signups finish and how long until the tournament ends.
● The option to make players require a boat to fish.
● Multiple random tournaments each tsunami.
● Dynamic fishing reputation system.
● Higher tier fishing rod crafting bench.
● Fish market sell shop.
● valuable gems sell shop.
● Fishing rod crafting bench.
● 1st, 2nd, and 3rd tournament place cash and item rewards.
● Multiple fishing rods and fishing lures with different tiers.
● Dynamic and configurable minigames for each fishing rod tier.
● Fishing Rep to be able to unlock better fishing rods.
● Configured random zones each time a tournament begins.
● Menu displays all information about players in tournament and exactly the countdown time until a new one begins.
● 100 different chest locations to find while using the map.
● 35 unique custom items with each having custom high quality pngs.
● Treasure bottle that opens into a treasure map used to find hidden treasure around the map.
● Using the treasure map will turn you in the correct direction and make you point in the correct direction of the treasure chest that can be found.
● 6 different unique hand crafted custom animations with props.
● Uses configurable polyzones to setup the tournament area.
● Support for ps-lock, other core names, and other target systems.
● Runs at 0.0 ms resmon
● 2 illegal fishing reels that can only be used deep sea fishing. 
● both reels have a durability that gets used up when using.
● Support to make all fishing rods use ps-lock.

Requirements consist of:
QBCore OR ESX (other frameworks will work but not supported)
qb-menu OR ox_lib (ps-ui or any qb-menu resource name changed will work)
qb-target OR ox_target (any ps-inventory resource name changed will work)
Polyzone

(ALL MINIGAMES ARE SUPPLIED IN THE SCRIPT)
--