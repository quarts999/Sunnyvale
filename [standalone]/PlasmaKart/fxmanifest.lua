fx_version 'cerulean'
game 'gta5'
lua54 'yes'
name 'PlasmaKart'
version '2.0.0'
author 'Sarish#0609 / sarish'
description 'PlasmaKart made by Patamods (Patatichette) (https://discord.gg/zmQgVe7)'


data_file 'HANDLING_FILE' 'data/handling.meta'

ui_page 'html/index.html'

files {
	'data/handling.meta',
	'html/index.html',
	'html/font/*.*',
	'html/img/*.*',
	'html/app.js',
	'html/style.css'
}
client_scripts {
   'config/unencrypted/client/target.lua',
   'config/unencrypted/client/sound.lua',
   'config/unencrypted/client/openEvent.lua',
    
   'client/ui.lua',
   'client/marker.lua',
   'client/gamemode.lua',
   'client/cam.lua'
}

shared_scripts {
	"debug/debug.lua",
	"config/config.lua",
	"config/outfitConfig.lua",
	"config/lang/*.lua",
}



server_scripts {
   'config/unencrypted/server/**/*.*',
   'server/*.*',
}



escrow_ignore {
	"debug/debug.lua",
	'config/*.*',
	'config/**/*.*',
	'config/**/**/*.*',
	'stream/*.*',
	
}

dependencies {
    '/gameBuild:2372'
}
dependency '/assetpacks'