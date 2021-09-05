-- load standard vis module, providing parts of the Lua API
require('vis')


vis.events.subscribe(vis.events.INIT, function()

	local lexers = vis.lexers
	lexers.STYLE_DEFAULT = 'back:'
	lexers.STYLE_SELECTION = 'back:magenta'

	-- language server protocol
	local lspc = require('plugins/vis-lspc')
	local c_lang_server = {name = 'clangd', cmd = 'clangd'}
	local java_lang_server = {name = 'jdt', cmd = 'eclipse.jdt.lsp'}
	lspc.ls_map = {cpp = c_lang_server, ansi_c = c_lang_server, java = java_lang_server}

end)


vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	vis:command('set number')
end)


