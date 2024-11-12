fx_version 'adamant'

author 'ItsVinnyX#0001'
version '3.0'
description 'Made for Hidden Roleplay (QBCore) - Trick or Treat Event'
game 'gta5'

client_scripts {
	'client/client.lua',
}

server_scripts {
	'server/server.lua',
}

shared_scripts {
	'configuration/config.lua'
}

escrow_ignore {
	'configuration/config.lua'
}

lua54 'yes'

dependency '/assetpacks'