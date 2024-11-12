fx_version 'cerulean'
games      { 'gta5' }
lua54 'yes'

author 'Prime Developments | Swizz'
description 'Brake cutting script by Prime Developments'
version '1.3.0'

--
-- Server
--

server_scripts {
    'config.lua',
    'locale/locale.lua',
    'server/editables/esx.lua',
    'server/editables/qb.lua',
    'server/server.lua',
}

--
-- Client
--

client_scripts {
    'config.lua',
    'locale/locale.lua',
    'client/editables/editables.lua',
    'client/functions.lua',
    'client/client.lua',
}

escrow_ignore {
    'client/editables/editables.lua',
    'server/server.lua',
    'config.lua',
    'locale/locale.lua',
    'server/editables/esx.lua',
    'server/editables/qb.lua',
}

dependency '/assetpacks'