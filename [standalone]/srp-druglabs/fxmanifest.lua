fx_version 'cerulean'
game 'gta5'
lua54 'yes'

version '1.0.0'
description 'Sunnyvale drug laboratory system'
author 'CodeBrew'

shared_scripts {
    'shared/config.lua',
}

client_scripts{
    '@PolyZone/client.lua',
    '@PolyZone/CircleZone.lua',
    'client/main.lua',
} 

server_scripts{
    'server/main.lua',
} 

dependencies {
    'PolyZone',
	'qb-target'
}
