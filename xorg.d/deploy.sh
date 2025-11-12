#!/bin/bash

ln -snf $(realpath xresources) ~/.Xresources
ln -snf $(realpath xinitrc) ~/.xinitrc
ln -snf $(realpath xbindkeysrc) ~/.xbindkeysrc

select wm in dwm fvwm xfce4 none; do
	[ "$wm" = "none" ]\
		&& exit
	cd $wm && ./deploy.sh
	exit
done

