
require('vis')

vis.events.subscribe(vis.events.INIT, function()

	local lexers = vis.lexers

	lexers.STYLE_DEFAULT ='back:black,fore:white'
	lexers.STYLE_NOTHING = 'back:black'
	lexers.STYLE_CLASS = 'fore:white,bold'
	lexers.STYLE_COMMENT = 'fore:white'
	lexers.STYLE_CONSTANT = 'fore:white,bold'
	lexers.STYLE_DEFINITION = 'fore:white,bold'
	lexers.STYLE_ERROR = 'fore:red,bold'
	lexers.STYLE_FUNCTION = 'fore:white,bold'
	lexers.STYLE_KEYWORD = 'fore:white,bold'
	lexers.STYLE_LABEL = 'fore:white,bold'
	lexers.STYLE_NUMBER = 'fore:white'
	lexers.STYLE_OPERATOR = 'fore:white'
	lexers.STYLE_REGEX = 'fore:white'
	lexers.STYLE_STRING = 'fore:cyan'
	lexers.STYLE_PREPROCESSOR = 'fore:white,bold'
	lexers.STYLE_TAG = 'fore:white,bold'
	lexers.STYLE_TYPE = 'fore:white,bold'
	lexers.STYLE_VARIABLE = 'fore:white,bold'
	lexers.STYLE_WHITESPACE = ''
	lexers.STYLE_EMBEDDED = 'back:white,bold'
	lexers.STYLE_IDENTIFIER = 'fore:white'

	lexers.STYLE_LINENUMBER = 'fore:white'
	lexers.STYLE_LINENUMBER_CURSOR = lexers.STYLE_LINENUMBER
	lexers.STYLE_CURSOR = 'reverse'
	lexers.STYLE_CURSOR_PRIMARY = lexers.STYLE_CURSOR..',fore:white'
	lexers.STYLE_CURSOR_LINE = 'underlined'
	lexers.STYLE_COLOR_COLUMN = 'back:cyan'
	lexers.STYLE_SELECTION = 'fore:black,back:blue'
	lexers.STYLE_STATUS = 'reverse'
	lexers.STYLE_STATUS_FOCUSED = 'reverse,bold'
	lexers.STYLE_SEPARATOR = lexers.STYLE_DEFAULT
	lexers.STYLE_INFO = 'fore:default,back:default,bold'
	lexers.STYLE_EOF = ''

end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	vis:command('set number')
	vis:command('set tabwidth 6')
	--vis:command('set colorcolumn 80')
	vis:command('set syntax off')
end)

