author "FiveM Store"
description "Standalone ND Framework fuel with hose & nozle"
version "1.0.2"

fx_version "cerulean"
game "gta5"
lua54 "yes"

files {
    "source/digital-counter-7.ttf",
    "source/background.png",
    "source/index.html"
}
ui_page "source/index.html"

shared_script "config.lua"
server_scripts {
    "source/server.lua"
}
client_scripts {
    "source/client.lua"
}
