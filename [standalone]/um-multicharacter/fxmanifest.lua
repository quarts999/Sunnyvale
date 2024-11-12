fx_version 'cerulean'
game 'gta5'

name "um-multicharacter"
author "uyuyorum store"
version "4.1.7-next"
description "UM - Multi Character"

ui_page 'web/build/index.html'

files {
	'web/build/index.html',
	'web/build/**',
	'locales/*.lua',
}

shared_scripts {
	'@ox_lib/init.lua',
	'list/*.lua',
	'config.lua',
	'framework/custom.lua',
}

client_scripts {
	'client/*.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/**',
	'framework/getskin.lua',
}


escrow_ignore {
	'config.lua',
	'locales/*.lua',
	'list/*.lua',
	'server/editable/*.lua',
	'server/list/*.lua',
	'framework/*.lua',
}

dependencies {
	'/server:7290',
	'ox_lib',
	'/onesync'
}

lua54 'yes'
use_experimental_fxv2_oal 'yes'

dependency '/assetpacks'