# enable transparency
xcompmgr &

# set wallpaper
xwallpaper --stretch ~/.wallpaper

# set keyboard layout
setxkbmap -layout us,ru -option grp:alt_shift_toggle

# move cursor out of the way
xdotool mousemove 10000 10000

# set root window name
while true
do
	xsetroot -name "$(date +' %d.%m.%Y %H:%M ')"
	sleep 30
done &

# start window manager
exec dwm

