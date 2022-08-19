fx_version 'cerulean'

games { 'rdr3', 'gta5' }

author 'Jesper "jeppe" Forsgren'

description 'Made by jeppe'

version '1.0.0'

ui_page 'html/index.html'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/main.lua',
}

shared_script{
	'config.lua'
}

client_scripts {
	'client/main.lua',
	'client/nui.lua',
}

files {
	'html/index.html',
	'html/js/app.js',
	'html/css/style.css',
}