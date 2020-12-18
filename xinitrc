# enable transparency
xcompmgr &

# set wallpaper
xwallpaper --stretch ~/.wallpaper

# set keyboard layout
setxkbmap -layout us,ru -option grp:alt_shift_toggle

# move cursor out of the way
xdotool mousemove 10000 10000

# set root window name
xsetroot -name " dwm "

# start window manager
exec dwm

