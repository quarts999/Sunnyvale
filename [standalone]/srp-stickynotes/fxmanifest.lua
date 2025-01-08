fx_version 'cerulean'
game 'gta5'

author 'Your Name' -- Replace with your name or team
description 'Sticky Note with Hidden Location Reveal and Blip System'
version '1.0.0'

-- Define the dependencies for the script
dependencies {
    'qb-core'  -- Make sure the QBCore Framework is a dependency
}

-- Server scripts
server_script 'server/main.lua'

-- Client scripts
client_script 'client/main.lua'

-- Shared files
shared_script 'shared/config.lua'

-- UI/HTML if you have (not required for this script)
-- ui_page 'html/index.html'
-- files {
--     'html/index.html',
--     'html/css/*.css',
--     'html/js/*.js',
-- }
