# enable transparency
xcompmgr &

# set wallpaper
xwallpaper --stretch ~/.wallpaper

# set keyboard layout
setxkbmap -layout us,ru -option grp:alt_shift_toggle

# dwm status bar
while true
do
	xsetroot -name " $(date +'%a %b %d %H:%M') "
	sleep 10s
done &

# start window manager
exec dwm

