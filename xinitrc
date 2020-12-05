# enable transparency
xcompmgr &

# set wallpaper
xwallpaper --stretch ~/.wallpaper

# set keyboard layout
setxkbmap -layout us,ru -option grp:alt_shift_toggle

# set root window name
while true
do
	xsetroot -name "$(date +' %d.%m.%Y %H:%M ')"
	sleep 30
done &

# start window manager
exec dwm

