require('vis')

-- global configuration options
vis.events.subscribe(vis.events.INIT, function()
	vis:command('set theme custom')
end)

-- per window configuration options
vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	vis:command('set number')
end)

