-- config.lua
Config = {}

-- Configurable Sticky Note Item
Config.StickyNoteItem = "stickynote"  -- Name of the item in your inventory

-- List of hidden locations where the blip will appear
Config.HiddenLocations = {
    { x = 1569.67, y = -2129.59, z = 78.33 },  -- Weed Lab 1569.67, -2129.59, 78.33
    { x = -1981.88, y = -241.61, z = 34.98 }, -- Coke Lab -1981.88, -241.61, 34.98
    { x = -39.13, y = 6420.45, z = 31.69 },    -- Meth Lab -39.13, 6420.45, 31.69
    { x = -288.58, y = -1637.82, z = 30.9 },    -- Skunk Field
    { x = -1736.21, y = 1865, z = 63.37 },    -- White Widow Field
    { x = 1319, y = 1865, z = 90 },    -- Amnesia Field
    { x = 771.75, y = -232.28, z = 65.11 },    -- AK47 Field
    { x = 2137.64, y = 5165.37, z = 52.42 },    -- Purple Haze Field
    { x = 475.11, y = 2646.85, z = 42.21 },    -- OG Kush Field
    { x = 3492.11, y = 2577.87, z = 11.99 },    -- OG Kush Field

    -- Add more locations as needed
}

-- Blip Configuration (Customizable)
Config.BlipConfig = {
    sprite = 66,               -- Sprite of the blip (default: 1)
    color = 2,                -- Color of the blip (default: 2 for green)
    scale = 0.4,              -- Scale of the blip (default: 0.8)
    name = "Hidden Location", -- Name of the blip
    radiusScale = 200.0,      -- Scale of the radius blip (default: 200.0)
    radiusColor = 2,          -- Color of the radius blip (default: 2 for green)
    radiusAlpha = 100         -- Alpha transparency of the radius blip (default: 100)
}
