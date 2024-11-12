-- Made for Hidden Roleplay --
-- Hidden Roleplay"s Discord: https://discord.gg/9h6cz66wdf --

-- Thank you for purchasing! --
-- If you need support feel free to reach out! --
-- HOW TO USE: --
-- Put in your own items inside the Items Array. Also, make sure you"re following the format! --
-- Follow the instructions below --

-- If needed, assistance via Discord. --
-- Discord Contact: ItsVinnyX#0001 --
-- My Discord Server: https://discord.gg/ebdM6nsNdq --

-- DO NOT CHANGE THIS VARIABLE --
Config = {} -- <--- DO NOT CHANGE! --
-- ^^ DO NOT CHANGE THIS VARIABLE ^^ --

-- Ace Permission | This will be the permission needed to use the commands below --
Config.acePermissionToUse = "trickOrTreat.admin"

-- Start Event Announcement via /startEvent --
Config.startEventMessage = "TRICK OR TREAT: Event started!"

-- End Event Announcement via /endEvent --
Config.endEventMessage = "TRICK OR TREAT: Event ended!"

-- Controls: https://docs.fivem.net/docs/game-references/controls/ --
Config.interactKey = 54 -- E key by Default. --

-- Blip Config --
-- https://docs.fivem.net/docs/game-references/blips/ --
Config.BlipId = 40 -- House Blip
Config.BlipTitle = "Trick or Treat Event" -- Title of Blip
Config.BlipColor = 47 -- Color is Orange
Config.BlipScale = 0.35 -- Size of Blip

-- Icon Marker Config --
-- https://docs.fivem.net/docs/game-references/markers/ --
Config.MarkerId = 2 -- Up Arrow
Config.MarkerR = 242 -- RGBA (Red Value)
Config.MarkerG = 120 -- RGBA (Green Value)
Config.MarkerB = 75 -- RGBA (Blue Value)
Config.MarkerA = 222 -- RGBA (Alpha Value)

-- https://github.com/plunkettscott/interact-sound/releases/ | Play custom sounds when you interact with a door. --
Config.useInteractSound = true
Config.announceSoundToPlay = "WITCH" -- Found in sounds folder. --
Config.doorSoundToPlay = "HALLOWEEN" -- Found in sounds folder. --

-- Icon Popup Message to Display by the door entrance. --
Config.trickOrTreatMsg = "~y~~h~Press ~o~E ~y~~h~ to Trick or Treat"

-- Use cooldown after maxLootableHouses is reached. --
Config.useCooldown = true

-- Max houses a player can trick or treat at. --
Config.maxLootableHouses = 2

-- If useCooldown is true and a player has reached max lootable houses, this message will send. --
Config.maxHousesReachedMsg = "You are on cooldown! Please wait:"

-- If useCooldown is true, this will be the time in seconds (SIMPLE GOOGLE SEARCH) once maxLootableHouses is reached. --
Config.cooldownTime = 900 -- 15 Minutes in seconds.

-- If useCooldown is true and a player's cooldown is over, this message will send. --
Config.cooldownOverMsg = "Your cooldown is over. You may Trick or Treat again!"

-- If usePeds is true then random peds from the list below will spawn at the doors --
Config.usePeds = true

-- PEDs to spawn at the doors --
-- https://docs.fivem.net/docs/game-references/ped-models/ --
Config.Peds = {
    "a_f_m_fatcult_01",
    "a_m_m_afriamer_01",
    "a_m_y_smartcaspat_01",
    "u_m_y_juggernaut_",
    "u_m_y_rsranger_01",
    "u_m_y_mani",
    "u_m_y_dancerave_01",
    "u_m_m_streetart_01",
    "u_m_o_filmnoir",
    "u_f_o_eileen",
    "u_f_y_dancerave_01",
    "ig_trafficwarden",
    "ig_prolsec_02",
    "ig_rashcosvki",
    "ig_michelle",
    "ig_floyd",
    "ig_claypain",
    "ig_clay",
    "ig_chrisformage",
    "ig_bride",
    "u_m_y_zombie_01",
    "a_m_y_beach_03",
    "a_m_y_musclbeac_01",
    "cs_orleans",
    "csb_ramp_marine"
}

-- Normal Tier Items to give. --
Config.Items = {
  "pistolammo",
  "ifak",
  "bandage"
}

-- Do you want to randomize the items given per house? If false the default is 1. --
Config.useRandomItemRange = true

-- Chance for the individual to obtain one of these items. --
Config.useRandomItemRange = true

-- Item amount to give, if useRandomItemRange is set to false it will use this value. --
Config.itemAmount = 1

-- The range amount of items given per house given, example: beancoffee could be given anywhere from 2 - 6 counts.
Config.itemRangeOne = 1
Config.itemRangeTwo = 3

-- RARE TIER --
-- Do you want a rare tier? If so mark this true if not then mark it false.
Config.useRareTier = false

-- The range amount of items given per house given, example: beancoffee could be given anywhere from 1 - 3 counts.
Config.rareItemRangeOne = 1
Config.rareItemRangeTwo = 3

-- Chance of an item being given from the rare tier
Config.rareChance = 10 -- This means 10%

-- If rare tier is enabled these are the items to give. --
Config.RareItems = {
  "pistolammo",
  "ifak",
  "bandage"
}
-- END OF RARE TIER --

-- Do you want to give money per house? --
Config.giveMoney = true

-- In which account do you want money to be deposited in? Cash or Bank?
Config.accountType = "cash" -- Use "bank" for money given per house to be directly deposited into their bank account.

-- Do you want to randomize the amount of money given per house? If false the default is $500. --
Config.useRandomMoneyRange = true

-- Money amount to give, if useRandomMoneyRange is set to false it will use this value. --
Config.moneyAmount = 500

-- The range amount of money per house given, example: $500 - $1250 randomized range between these two values.
Config.moneyRangeOne = 500
Config.moneyRangeTwo = 1250

-- Door Configuration for Houses. You can add more if needed. --
Config.Houses = {
    {
        coords = vector3(-34.035636901855, -1847.2677001953, 26.193517684937),
        looted = false -- DO NOT CHANGE -- -- DO NOT CHANGE --
    },

    {
        coords = vector3(-20.66693687439, -1858.7166748047, 25.408672332764),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(21.013378143311, -1844.4187011719, 24.601734161377),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(-4.8931722640991, -1872.109375, 24.151016235352),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(5.0542683601379, -1884.2237548828, 23.697267532349),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(45.982795715332, -1864.2603759766, 23.278301239014),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(23.289144515991, -1896.6623535156, 22.965877532959),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(39.174945831299, -1911.7375488281, 21.953496932983),
        looted = false -- DO NOT CHANGE --
    },
    
	{
        coords = vector3(54.290884094238, -1873.3463403320, 22.819110660552),
        looted = false
    },
    
    {
        coords = vector3(56.710884094238, -1922.6340332031, 21.911066055298),
        looted = false -- DO NOT CHANGE --
    },
	
    {
        coords = vector3(72.294219970703, -1938.9985351563, 21.369119644165),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(76.244407653809, -1948.2615966797, 21.174133300781),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(85.894096374512, -1959.4940185547, 21.121673583984),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(114.35620880127, -1961.0100097656, 21.334175109863),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(126.81433105469, -1929.8228759766, 21.382415771484),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(126.81433105469, -1929.8228759766, 21.382415771484),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(118.23268127441, -1920.9901123047, 21.323425292969),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(100.98261260986, -1912.2362060547, 21.407423019409),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(-1065.75, -1545.79, 4.9),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(-988.82, -1575.69, 5.23),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(-935.62, -1523.25, 5.24),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(-1070.5, -1515.06, 5.3),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(-1118.55, -1439.91, 5.11),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(-1256.29, -1331.01, 4.08),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(-1269.75, -1296.23, 4.0),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(-1286.19, -1266.93, 5.52),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(-1308.55, -1227.95, 4.9),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(-1226.02, -1207.49, 8.27),
        looted = false -- DO NOT CHANGE --
    },


    {
        coords = vector3(-1219.3, -1233.82, 7.04),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(-1113.81, -1193.77, 2.38),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(-1063.53, -1160.32, 2.75),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(-1068.08, -1163.22, 2.75),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(-1034.11, -1146.82, 2.16),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(-1045.83, -1159.73, 2.16),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(-1040.46, -1135.9, 2.16),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(-1024.45, -1140.03, 2.75),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(-991.64, -1103.43, 2.15),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(-977.99, -1108.21, 2.15),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(-952.47, -1077.57, 2.67),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(-943.19, -1075.39, 2.75),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(-884.33, 1072.63, 2.53),
        looted = false -- DO NOT CHANGE --
    },

    {
        coords = vector3(-900.78, -982.47, 2.24),
        looted = false -- DO NOT CHANGE --
    },
    
    {
        coords = vector3(-927.92, -949.42, 2.75),
        looted = false -- DO NOT CHANGE --
    },
    
    {
        coords = vector3(-935.18, -939.05, 2.15),
        looted = false -- DO NOT CHANGE --
    },
    
    {
        coords = vector3(-948.19, -910.51, 2.75),
        looted = false -- DO NOT CHANGE --
    },
    
    {
        coords = vector3(-951.37, -905.09, 2.75),
        looted = false -- DO NOT CHANGE --
    },
    
    {
        coords = vector3(-960.82, -941.41, 2.15),
        looted = false -- DO NOT CHANGE --
    },
    
    {
        coords = vector3(-948.27, -951.56, 2.15),
        looted = false -- DO NOT CHANGE --
    },
    
    {
        coords = vector3(-995.43, -967.36, 2.55),
        looted = false -- DO NOT CHANGE --
    },
    
    {
        coords = vector3(-1023.35, -998.01, 2.15),
        looted = false -- DO NOT CHANGE --
    },
    
    {
        coords = vector3(-1022.25, -1023.01, 2.15),
        looted = false -- DO NOT CHANGE --
    },
    
    {
        coords = vector3(-1041.48, -1025.71, 2.75),
        looted = false -- DO NOT CHANGE --
    },
    
    {
        coords = vector3(-1056.02, -1000.84, 2.15),
        looted = false -- DO NOT CHANGE --
    },
    
    {
        coords = vector3(-1108.76, -1040.91, 2.15),
        looted = false -- DO NOT CHANGE --
    },
    
    {
        coords = vector3(-1103.89, -1059.9, 2.73),
        looted = false -- DO NOT CHANGE --
    },
    
    {
        coords = vector3(-1114.22, -1069.25, 2.15),
        looted = false -- DO NOT CHANGE --
    },
    
    {
        coords = vector3(-1122.76, -1089.26, 2.55),
        looted = false -- DO NOT CHANGE --
    },
    
    {
        coords = vector3(-1152.14, -913.5, 6.99),
        looted = false -- DO NOT CHANGE --
    },
    
    {
        coords = vector3(-1111.5, -902.11, 3.79),
        looted = false -- DO NOT CHANGE --
    },
    
    {
        coords = vector3(-1317.01, -904.1, 11.31),
        looted = false -- DO NOT CHANGE --
    },
        
    {
        coords = vector3(-1372.22, -901.07, 12.47),
        looted = false -- DO NOT CHANGE --
    },
        
    {
        coords = vector3(-1371.17, -1001.25, 8.38),
        looted = false -- DO NOT CHANGE --
    },
        
    {
        coords = vector3(-1343.45, -1044.14, 7.82),
        looted = false -- DO NOT CHANGE --
    },
        
    {
        coords = vector3(-1320.41, -1044.75, 7.46),
        looted = false -- DO NOT CHANGE --
    },
        
    {
        coords = vector3(-1343.21, -1091.18, 6.94),
        looted = false -- DO NOT CHANGE --
    },
        
    {
        coords = vector3(-1011.41, -1224.05, 5.95),
        looted = false -- DO NOT CHANGE --
    },
        
    {
        coords = vector3(-1001.94, -1218.48, 5.75),
        looted = false -- DO NOT CHANGE --
    },
        
    {
        coords = vector3(-986.99, -1199.5, 6.05),
        looted = false -- DO NOT CHANGE --
    },
        
    {
        coords = vector3(-928.42, -1510.92, 5.18),
        looted = false -- DO NOT CHANGE --
    },
        
    {
        coords = vector3(-894.16, 1498.64, 5.18),
        looted = false -- DO NOT CHANGE --
    },
        
    {
        coords = vector3(-981.37, -1563.48, 5.18),
        looted = false -- DO NOT CHANGE --
    },
        
    {
        coords = vector3(-947.36, -1551-08, 5.18),
        looted = false -- DO NOT CHANGE --
    },
        
    {
        coords = vector3(-935.62, -1523.14, 5.24),
        looted = false -- DO NOT CHANGE --
    },
        
    {
        coords = vector3(-684.17, -1198.68, 10.71),
        looted = false -- DO NOT CHANGE --
    },
        
    {
        coords = vector3(-702.37, -1288.38, 5.1),
        looted = false -- DO NOT CHANGE --
    },
        
    {
        coords = vector3(-1899.07, 132.34, 81.98),
        looted = false -- DO NOT CHANGE --
    },
        
    {
        coords = vector3(-1873.34, 202.23, 84.36),
        looted = false -- DO NOT CHANGE --
    },
        
    {
        coords = vector3(-1931.88, 162.44, 84.65),
        looted = false -- DO NOT CHANGE --
    },
        
    {
        coords = vector3(-1905.73, 253.16, 86.45),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1961.11, 211.67, 86.8),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1970.44, 245.89, 87.81),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1922.38, 298.32, 89.29),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1995.47, 301.03, 91.96),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-2009.0, 367.24, 94.81),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1931.24, 362.43, 93.98),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1940.48, 387.67, 96.71),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1942.71, 449.57, 102.93),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-2011.07, 444.81, 103.02),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-2014.8, 500.2, 107.17),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1937.5, 551.12, 115.02),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1996.29, 591.27, 118.1),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(-1928.98, 595.38, 122.28),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1974.63, 630.67, 122.54),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1896.39, 642.65, 130.21),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1828.37, 312.08, 89.71),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1807.95, 333.13, 89.57),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1733.34, 378.88, 89.73),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1672.99, 385.48, 89.35),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1540.09, 420.64, 110.01),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(-1496.07, 436.8, 112.5),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1500.61, 523.14, 118.27),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1454.13, 512.34, 117.8),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1413.26, 462.04, 109.21),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1371.49, 444.21, 105.86),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1349.06, 472.98, 102.76),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1307.94, 449.0, 100.97),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1294.18, 453.14, 97.64),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(-1277.89, 496.98, 97.89),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1216.21, 457.85, 92.06),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1174.47, 440.13, 86.85),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1158.19, 481.78, 86.09),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1122.59, 486.27, 82.36),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1087.2, 479.5, 81.53),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1094.91, 427.2, 75.88),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1052.42, 432.51, 77.26),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(-1038.04, 382.22, 69.93),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-983.62, 428.85, 80.57),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-968.08, 436.97, 80.57),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-950.03, 464.9, 80.8),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-967.16, 510.64, 82.07),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-986.98, 487.21, 82.46),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1007.25, 513.52, 79.77),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1009.35, 479.36, 79.41),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(-1062.49, 476.06, 81.32),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1193.12, 564.03, 100.34),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(-1167.0, 568.68, 101.83),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1146.4, 545.9, 101.91),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(-1125.64, 548.32, 102.57),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-1107.75, 594.49, 104.45),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(-1021.97, 586.95, 103.43),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-974.31, 581.81, 103.15),
        looted = false -- DO NOT CHANGE --
    },    
                
    {
        coords = vector3(-957.95, 604.55, 105.44),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-947.71, 567.74, 101.51),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(-924.55, 561.24, 100.16),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-904.25, 587.94, 101.19),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(-907.48, 544.75, 100.4),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-869.44, 551.59, 97.03),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(-907.64, 544.99, 100.21),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-884.53, 517.89, 92.44),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(-848.8, 508.59, 90.82),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-842.78, 466.5, 87.6),
        looted = false -- DO NOT CHANGE --
    },    

                
    {
        coords = vector3(372.2, 427.82, 145.68),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(346.17, 440.48, 148.0),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(331.42, 465.28, 151.25),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(315.81, 502.02, 153.18),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(325.08, 537.08, 153.87),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(224.25, 513.56, 140.92),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(169.59, 483.08, 142.4),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(119.89, 494.44, 147.34),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(106.97, 466.64, 147.56),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(79.74, 486.14, 148.2),
        looted = false -- DO NOT CHANGE --
    },    

                
    {
        coords = vector3(57.65, 449.55, 147.07),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(42.77, 468.84, 148.1),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(-8.24, 467.98, 145.85),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-66.74, 490.03, 144.88),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(-110.08, 501.93, 143.48),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-174.49, 502.77, 137.42),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(-230.15, 487.96, 128.77),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-312.16, 474.71, 111.82),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(-213.56, 39.68, 111.3),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-166.63, 423.93, 111.81),
        looted = false -- DO NOT CHANGE --
    },    

                
    {
        coords = vector3(-73.1, 428.56, 113.04),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(-6.45, 409.25,  120.29),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(38.02, 365.88, 116.04),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(8.82, 540.56, 176.03),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(45.9, 555.86, 180.08),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(85.03, 561.71, 182.77),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(118.99, 563.98, 183.96),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(216.42, 620.66, 107.76),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(232.3, 672.21, 19.98),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(228.8, 765.98, 204.98),
        looted = false -- DO NOT CHANGE --
    },    

                
    {
        coords = vector3(1262.29, -429.74, 70.01),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(1265.71, -458.29, 70.52),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(1259.63, -480.23, 70.19),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(1251.52, -494.17, 69.91),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(1250.94, -515.31, 69.35),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(1114.51, -391.14, 68.95),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(1107.07, -411.25, 67.56),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(1099.59, -438.66, 67.79),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(1100.05, -450.76, 67.79),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(1098.82, -464.6, 67.32),
        looted = false -- DO NOT CHANGE --
    },    

                
    {
        coords = vector3(1090.48, -484.14, 65.66),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(1060.57, -378.11, 68.23),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(1028.76, -408.37, 66.34),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(1010.4, -423.42, 65.35),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(987.35, -433.09, 64.05),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(1014.74, -469.24, 64.5),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(967.26, -451.49, 62.79),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(944.36, -463.08, 61.55),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(970.32, -502.38, 62.14),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(945.74, -518.85, 60.63),
        looted = false -- DO NOT CHANGE --
    },    

                
    {
        coords = vector3(921.8, -477.9, 61.08),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(924.52, -525.98, 59.79),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(906.24, -489.45, 59.44),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(878.44, -497.87, 58.09),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(861.47, -509.08, 57.72),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(850.27, -532.7, 57.93),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(843.76, -562.62, 57.99),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(893.13, -540.58, 58.51),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(861.99, -583.56, 58.16),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(886.84, -608.08, 58.45),
        looted = false -- DO NOT CHANGE --
    },    

                
    {
        coords = vector3(903.03, -615.48, 58.45),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(928.86, -639.74, 58.24),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(943.19, -653.36, 58.63),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(980.25, -627.64, 59.24),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(960.01, -669.98, 58.45),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(970.78, -701.41, 58.48),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(979.3, -716.37, 58.22),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(996.78, -729.45, 57.82),
        looted = false -- DO NOT CHANGE --
    },
                
    {
        coords = vector3(999.53, -593.95, 59.64),
        looted = false -- DO NOT CHANGE --
    },
            
    {
        coords = vector3(1009.61, -572.48, 60.59),
        looted = false -- DO NOT CHANGE --
    },  
             
    {
        coords = vector3(1006.46, -510.87, 60.99),
        looted = false -- DO NOT CHANGE --
    }, 

                
    {
        coords = vector3(987.69, -525.85, 60.69),
        looted = false -- DO NOT CHANGE --
    }, 
                
    {
        coords = vector3(965.18, -541.97, 59.73),
        looted = false -- DO NOT CHANGE --
    },  
             
    {
        coords = vector3(976.76, -580.61, 59.85),
        looted = false -- DO NOT CHANGE --
    }, 

                
    {
        coords = vector3(964.29, -596.21, 59.9),
        looted = false -- DO NOT CHANGE --
    }, 
                
    {
        coords = vector3(919.82, -569.58, 58.37),
        looted = false -- DO NOT CHANGE --
    },  
             
    {
        coords = vector3(1046.32, -498.16, 64.28),
        looted = false -- DO NOT CHANGE --
    }, 

                
    {
        coords = vector3(1090.44, -484.43, 65.66),
        looted = false -- DO NOT CHANGE --
    }, 
                
    {
        coords = vector3(1051.07, -470.4, 64.3),
        looted = false -- DO NOT CHANGE --
    },  
             
    {
        coords = vector3(1098.5, -464.44, 67.32),
        looted = false -- DO NOT CHANGE --
    }, 

                
    {
        coords = vector3(1056.16, -448.91, 66.26),
        looted = false -- DO NOT CHANGE --
    }, 
                
    {
        coords = vector3(1100.12, -450.91, 67.79),
        looted = false -- DO NOT CHANGE --
    },  
             
    {
        coords = vector3(1101.06, -411.42, 67.56),
        looted = false -- DO NOT CHANGE --
    }, 

                
    {
        coords = vector3(1241.56, -566.05, 69.66),
        looted = false -- DO NOT CHANGE --
    }, 
                
    {
        coords = vector3(1240.51, -601.59, 69.78),
        looted = false -- DO NOT CHANGE --
    },  
             
    {
        coords = vector3(1250.75, -620.96, 69.57),
        looted = false -- DO NOT CHANGE --
    }, 

                
    {
        coords = vector3(1265.79, -648.58, 68.12),
        looted = false -- DO NOT CHANGE --
    }, 
                
    {
        coords = vector3(1270.69, -683.55, 66.03),
        looted = false -- DO NOT CHANGE --
    },  
             
    {
        coords = vector3(1264.78, -702.74, 64.91),
        looted = false -- DO NOT CHANGE --
    }, 

                
    {
        coords = vector3(1229.6, -725.4, 60.96),
        looted = false -- DO NOT CHANGE --
    }, 
                
    {
        coords = vector3(1223.05, -696.73, 60.81),
        looted = false -- DO NOT CHANGE --
    },  
             
    {
        coords = vector3(1221.43, -669.31, 63.69),
        looted = false -- DO NOT CHANGE --
    }, 

                
    {
        coords = vector3(1207.37, -620.19, 66.44),
        looted = false -- DO NOT CHANGE --
    }, 
                
    {
        coords = vector3(1201.03, -575.6, 69.14),
        looted = false -- DO NOT CHANGE --
    },  
             
    {
        coords = vector3(1204.88, -557.94, 69.62),
        looted = false -- DO NOT CHANGE --
    }, 
}