fx_version 'cerulean'
game 'gta5'

description 'rcore job blips'
author 'maku#5434 (itismaku) & Isigar <info@rcore.cz>'
version '1.5.1'
lua54 'yes'

shared_scripts {
    'shared/sh-const.lua',

    'config.lua',

    'shared/sh-locale.lua',
    'locales/*.lua',

    'shared/sh-utils.lua',
    'shared/sh-table.lua',

    'shared/sh-detect.lua',
}

client_scripts {
    'client/bridge/cl-bridge.lua',
    'client/bridge/cl-gangs.lua',

    'client/bridge/framework/cl-esx.lua',
    'client/bridge/framework/cl-qbcore.lua',
    'client/bridge/framework/cl-standalone.lua',

    'client/bridge/inventory/cl-qb_inventory.lua',

    'client/cl-groups.lua',
    'client/cl-players.lua',
    'client/cl-vehicles.lua',
    'client/cl-blips.lua',
    'client/cl-main.lua',
}

server_scripts {
    'server/sv-utils.lua',

    'server/bridge/sv-bridge.lua',

    'server/bridge/framework/sv-esx.lua',
    'server/bridge/framework/sv-qbcore.lua',
    'server/bridge/framework/sv-standalone.lua',

    'server/bridge/inventory/sv-esx_inventory.lua',
    'server/bridge/inventory/sv-ox_inventory.lua',
    'server/bridge/inventory/sv-qb_inventory.lua',
    'server/bridge/inventory/sv-mf_inventory.lua',

    'server/bridge/duty/sv-qbcore.lua',
    'server/bridge/duty/sv-none.lua',

    'server/sv-prefix_suffix.lua',
    'server/sv-groups.lua',
    'server/sv-players.lua',
    'server/sv-resolver.lua',
    'server/sv-duty.lua',
    'server/sv-main.lua',
}

escrow_ignore {
    'config.lua',

    'shared/sh-const.lua',
    'shared/sh-table.lua',
    'shared/sh-utils.lua',

    'server/sv-utils.lua',
    'server/sv-prefix_suffix.lua',
    'server/bridge/framework/*.lua',
    'server/bridge/inventory/*.lua',
    'server/bridge/duty/*.lua',

    'client/bridge/framework/*.lua',
    'client/bridge/inventory/*.lua',
    'client/bridge/cl-gangs.lua',

    'locales/*.lua'
}

dependency '/assetpacks'