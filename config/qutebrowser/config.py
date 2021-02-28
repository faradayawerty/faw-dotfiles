import subprocess

def read_xresources(prefix):
    props = {}
    x = subprocess.run(['xrdb', '-query'], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split('\n')
    for line in filter(lambda l : l.startswith(prefix), lines):
        prop, _, value = line.partition(':\t')
        props[prop] = value
    return props

xresources = read_xresources('*')


# user bindings
config.bind(',m', 'hint links spawn mpv --ytdl-format="bestvideo[height<=?360]+bestaudio/best" {hint-url}')
config.bind(',M3', 'hint links spawn mpv --ytdl-format="bestvideo[height<=?360]+bestaudio/best" {hint-url}')
config.bind(',M4', 'hint links spawn mpv --ytdl-format="bestvideo[height<=?480]+bestaudio/best" {hint-url}')
config.bind(',M7', 'hint links spawn mpv --ytdl-format="bestvideo[height<=?720]+bestaudio/best" {hint-url}')

#config.bind(',p', 'hint links run open --private {hint-url}')

# general
c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/html/?q={}', 'g': 'https://www.google.com.ar/search?q={}', 'y': 'https://yandex.ru/search/?text={}','yt': 'https://www.youtube.com/results?search_query={}', 'aw': 'https://wiki.archlinux.org/?search={}', 'w': 'https://wikipedia.org/w/index.php?search={}', 's': 'https://store.steampowered.com/search/?term={}', 'k': 'https://kinopoisk.ru/index.php?kp_query={}', 'dw': 'https://wiki.debian.org/FrontPage?action=fullsearch&context=180&value={}&titlesearch=Titles'}
config.load_autoconfig(False)

config.set('completion.open_categories', ["searchengines", "quickmarks", "bookmarks", "history"])
config.set('tabs.show', 'multiple')

# privacy settings
#config.set('content.webgl', False)
#config.set('content.canvas_reading', False)
#config.set('content.javascript.enabled', False)
#config.set('content.cookies.store', False)
#config.set('content.cookies.accept', "never")
#config.set('content.headers.user_agent', 'Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101 Firefox/68.0')
#config.set('content.headers.accept_language', "en-US,en;q=0.5")
#config.set('content.headers.custom', {"accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"})
#config.set('content.proxy', 'socks://localhost:9050/')
#config.set('content.private_browsing', True)
#config.set('content.headers.do_not_track', True)

# settings
c.url.default_page = 'https://duckduckgo.com/html/'
c.url.start_pages = 'about:blank'
c.zoom.default = '100%'
c.tabs.favicons.show = "never"
c.statusbar.position = "top"
c.input.insert_mode.auto_leave = False
config.set('downloads.location.directory', '~')


# colors
color = {
    'background': xresources['*.background'],
    'foreground': xresources['*.foreground'],

    'black': xresources['*.color0'],
    'red': xresources['*.color1'],
    'green': xresources['*.color2'],
    'yellow' : xresources['*.color3'],
    'blue': xresources['*.color4'],
    'magenta': xresources['*.color5'],
    'cyan': xresources['*.color6'],
    'white': xresources['*.color7'],

    'brightblack': xresources['*.color8'],
    'brightred': xresources['*.color9'],
    'brightgreen': xresources['*.color10'],
    'brightyellow': xresources['*.color11'],
    'brightblue': xresources['*.color12'],
    'brightmagenta': xresources['*.color13'],
    'brightcyan': xresources['*.color14'],
    'brightwhite': xresources['*.color15']

    #'black': "#111111", 
    #'red': "#d36265", 
    #'green': "#aece91", 
    #'yellow': "#e7e18c", 
    #'blue': "#5297cf", 
    #'magenta': "#963c59", 
    #'cyan': "#5e7175", 
    #'white': "#bebebe", 

    #'brightblack': "#666666", 
    #'brightred': "#ef8171", 
    #'brightgreen': "#cfefb3", 
    #'brightyellow': "#fff796", 
    #'brightblue': "#74b8ef", 
    #'brightmagenta': "#b85e7b", 
    #'brightcyan': "#a3babf", 
    #'brightwhite': "#ffffff", 

    #'background': "#000000", 
    #'foreground': "#ffffff" 
}

c.colors.completion.category.bg = color['background']
c.colors.completion.category.border.bottom = color['black']
c.colors.completion.category.border.top = color['black']
c.colors.completion.category.fg = color['cyan']
c.colors.completion.even.bg = color['background']
c.colors.completion.odd.bg = color['background']
c.colors.completion.fg = color['blue']
c.colors.completion.item.selected.border.bottom = color['black']
c.colors.completion.item.selected.border.top = color['black']
c.colors.completion.item.selected.bg = color['blue']
c.colors.completion.item.selected.fg = color['black']
c.colors.completion.match.fg = color['brightred']
c.colors.completion.scrollbar.bg = color['background']
c.colors.completion.scrollbar.fg = color['blue']

c.colors.downloads.bar.bg = color['background']
c.colors.downloads.error.bg = color['red']
c.colors.downloads.error.fg = color['foreground']
c.colors.downloads.stop.bg = color['blue']
c.colors.downloads.stop.fg = color['foreground']
c.colors.downloads.start.bg = color['blue']
c.colors.downloads.start.fg = color['foreground']
c.colors.downloads.system.bg = 'rgb'

#c.colors.hints.bg = color['blue']
#c.colors.hints.fg = color['black']
#c.colors.hints.match.fg = color['black']

c.colors.keyhint.bg = color['background']
c.colors.keyhint.fg = color['blue']
c.colors.keyhint.suffix.fg = color['blue']

c.colors.messages.error.bg = color['red']
c.colors.messages.error.border = color['red']
c.colors.messages.error.fg = color['foreground']
c.colors.messages.info.bg = color['brightcyan']
c.colors.messages.info.border = color['brightcyan']
c.colors.messages.info.fg = color['black']
c.colors.messages.warning.bg = color['brightred']
c.colors.messages.warning.border = color['brightred']
c.colors.messages.warning.fg = color['foreground']

c.colors.prompts.bg = color['background']
c.colors.prompts.border = '1px solid ' + color['black']
c.colors.prompts.fg = color['foreground']
c.colors.prompts.selected.bg = color['background']

c.colors.statusbar.caret.bg = color['blue']
c.colors.statusbar.caret.fg = color['foreground']
c.colors.statusbar.caret.selection.bg = color['blue']
c.colors.statusbar.caret.selection.fg = color['foreground']
c.colors.statusbar.command.bg = color['background']
c.colors.statusbar.command.fg = color['blue']
c.colors.statusbar.command.private.bg = color['background']
c.colors.statusbar.command.private.fg = color['red']
c.colors.statusbar.insert.bg = color['green']
c.colors.statusbar.insert.fg = color['black']
c.colors.statusbar.normal.bg = color['background']
c.colors.statusbar.normal.fg = color['blue']
c.colors.statusbar.passthrough.bg = color['blue']
c.colors.statusbar.passthrough.fg = color['foreground']
c.colors.statusbar.private.bg = color['background']
c.colors.statusbar.private.fg = color['red']
c.colors.statusbar.progress.bg = color['foreground']
c.colors.statusbar.url.error.fg = color['red']
c.colors.statusbar.url.fg = color['green']
c.colors.statusbar.url.hover.fg = color['brightcyan']
c.colors.statusbar.url.success.http.fg = color['foreground']
c.colors.statusbar.url.success.https.fg = color['green']
c.colors.statusbar.url.warn.fg = color['brightred']

c.colors.tabs.bar.bg = color['background']
c.colors.tabs.even.bg = color['background']
c.colors.tabs.even.fg = color['blue']
c.colors.tabs.odd.bg = color['background']
c.colors.tabs.odd.fg = color['blue']
c.colors.tabs.indicator.error = color['red']
c.colors.tabs.indicator.start = color['black']
c.colors.tabs.indicator.stop = color['white']
c.colors.tabs.indicator.system = 'none'
c.colors.tabs.selected.even.bg = color['blue']
c.colors.tabs.selected.even.fg = color['black']
c.colors.tabs.selected.odd.bg = color['blue']
c.colors.tabs.selected.odd.fg = color['black']

# c.colors.webpage.bg = color['foreground']
