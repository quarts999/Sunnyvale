Config = {
    Debug = false,                     -- [true/false] - Enables debug mode, which will print additional information to the console.

    Locale = 'en',                     -- [string] - The locale of the script. You can find all locales in `locales` folder.

    Framework = Framework.AUTO_DETECT, -- [AUTO_DETECT - auto-detect, ESX - es_extended, QBCore - qb-core, Standalone - standalone]
    Inventory = Inventory.AUTO_DETECT, -- [AUTO_DETECT - auto-detect, OX - ox_inventory, ESX - es_extended, QB - qb-inventory, QS - qs-inventory, MF - mf-inventory, CHEZZA - inventory, PS - ps-inventory, LJ - lj-inventory, TGIANN - tgiann-inventory]
    Duty = Duty.AUTO_DETECT,           -- [AUTO_DETECT - auto-detect, QBCore - qb-core, NONE - none]

    UseRCoreGangs = true,             -- [true/false] - Enables rcore_gangs support. If enabled, the script will use rcore_gangs instead of qb-core gangs.
    UseQBCallsigns = false,            -- [true/false] - Enables callsigns from QBCore as prefixes.

    ServerPositionSyncTime = 300,      -- [milliseconds] - How often the server should sync the positions of players.
    ClientPositionSyncTime = 500,      -- [milliseconds] - How often the client should sync the positions of players.
    VehicleSyncTime = 1000,            -- [milliseconds] - How often the server should sync informations about vehicles.

    Commands = {
        Prefix = 'prefix',
        Suffix = 'suffix',
    },

    DefaultBlip = {
        -- Placeholders:
        -- {JOB_NAME} - The name of the job.
        -- {GRADE_NAME} - The name of the grade.
        -- {PLAYER_NAME} - The name of the player.
        -- {PREFIX} - The prefix of the player.
        -- {SUFFIX} - The suffix of the player.
        name = '{PLAYER_NAME}', -- [string] - The name of the blip. You can use placeholders to display informations about the player.
        sprite = 60,            -- [integer] - The sprite of the blip. You can find all sprites here: https://docs.fivem.net/docs/game-references/blips/
        color = 2,              -- [integer] - The color of the blip. You can find all colors here: https://docs.fivem.net/docs/game-references/blips/
        scale = 1.0,            -- [float] - The scale of the blip.
        -- Display numbers:
        -- 2 = Shows on both main map and minimap.
        -- 4 = Shows on main map only.
        -- 5 = Shows on minimap only.
        display = 2,        -- [integer] - The display of the blip.
        shortRange = false, -- [true/false] - Whether the blip should be short range or not.
        category = 7,       -- [integer] - The category of the blip. (You can keep it on 7 forever, it's the default category for blips.)
    },

    ReplaceLocalPlayerBlip = false, -- [true/false] - Whether the script should replace the local player arrow blip or not.
    SelfBlipExclude = false,        -- [true/false] - Whether the player should see his own blip or not.

    BlipRotation = true,            -- [true/false] - Whether the blip should rotate or not.

    VehicleCategoryBlips = {        -- [integer/table] - The category of the blip for each vehicle class. You can provide here sprite or whole blip table.
        [VehicleClasses.PLANE] = 16,
        [VehicleClasses.HELI] = 43,
        [VehicleClasses.BOAT] = 410,
        [VehicleClasses.AUTOMOBILE] = 56,
        [VehicleClasses.BIKE] = 226,
        [VehicleClasses.TRAIN] = 545,
    },

    VehicleModelBlips = { -- [integer/table] - The blip for each vehicle model. Keep model in `` brackets! You can provide here sprite or whole blip table.
        [`police`] = 56,
        [`police2`] = {
            sprite = 56,
            color = 1,
        },
    },

    Blips = {
        {
            name = 'police',    -- [string] - The name of the group.
            requirements = {    -- [table] - The requirements to be in group.
                job = 'police', -- [string] - The job name.
                -- gang = 'police', -- [string] - The gang name. (Only if UseRCoreGangs is true or Framework is QBCore)
                grades = {      -- [table] - The grades of the job.
                    -- ⚠️⚠️ QBCORE: When you are using QBCore, you need to use GRADE NUMBERS INSTEAD OF NAMES! ⚠️⚠️
                    '1',
                    '2'
                },
                items = {} -- [table] - The items that the player must have to be in group.
            },
            see = {        -- [table] - The blips that the player should see when he is in group.
                'police',
                'police-leaders',
                'ems',
                'lsfd',
            },
            blip = {
                -- Placeholders:
                -- {JOB_NAME} - The name of the job.
                -- {GRADE_NAME} - The name of the grade.
                -- {PLAYER_NAME} - The name of the player.
                -- {PREFIX} - The prefix of the player.
                -- {SUFFIX} - The suffix of the player.
                name = '[{JOB_NAME} - {GRADE_NAME}] - {PREFIX} {PLAYER_NAME} {SUFFIX}', -- [string] - The name of the blip. You can use placeholders to display informations about the player.
                sprite = 60,                                                            -- [integer] - The sprite of the blip. You can find all sprites here: https://docs.fivem.net/docs/game-references/blips/
                color = 3,                                                              -- [integer] - The color of the blip. You can find all colors here: https://docs.fivem.net/docs/game-references/blips/
                headingIndicator = true,                                                -- [true/false] - Whether the blip should show heading indicator or not.
                showCone = true,
                category = 7,                                                           -- [integer] - The category of the blip. (You can keep it on 7 forever, it's the default category for blips.)
            },
            allowPrefixSuffixEdit = true,                                               -- [true/false] - Whether the player should be able to edit his prefix and suffix or not.
            vehicleBlip = {                                                             -- [table] - The blip if player is in vehicle. You can provide here sprite or whole blip table.
                color = 3,
                sirenFlash = 1,
            }
        },
        {
            name = 'police-leaders',
            requirements = {
                job = 'police',
                grades = {
                    'sergeant',
                    'lieutenant',
                    'boss',
                },
                items = {}
            },
            see = {
                'police',
                'police-leaders',
                'ems',
                'lsfd',
            },
            blip = {
                name = '[{JOB_NAME} - {GRADE_NAME}] - {PREFIX} {PLAYER_NAME} {SUFFIX}',
                sprite = 60,
                color = 29,
                showCone = true,
                headingIndicator = true,
                category = 7,
            },
            vehicleBlip = {
                color = 29,
                sirenFlash = 1,
            }
        },
        {
            name = 'ems',
            requirements = {
                job = 'ambulance',
            },
            see = {
                'police',
                'police-leaders',
                'ems',
                'lsfd',
            },
            blip = {
                name = '[{JOB_NAME}] - {PREFIX} {PLAYER_NAME}',
                sprite = 61,
                color = 1,
                showCone = true,
                headingIndicator = true,
                category = 7,
            },
            vehicleBlip = {
                color = 1,
                sirenFlash = 0,
            }
        },
        {
            name = 'lsfd',
            requirements = {
                job = 'lsfd',
            },
            see = {
                'police',
                'police-leaders',
                'ems',
                'lsfd',
            },
            blip = {
                name = '[{JOB_NAME}] - {PREFIX} {PLAYER_NAME}',
                sprite = 436,
                color = 1,
                showCone = true,
                headingIndicator = true,
                category = 7,
            },
            vehicleBlip = {
                sprite = 800,
                color = 1,
                sirenFlash = 0,
            }
        },
    }
}
