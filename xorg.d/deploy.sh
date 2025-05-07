#!/bin/bash

select wm in dwm fvwm xfce4 none; do
	[ "$wm" = "none" ]\
		&& exit
	cd $wm && ./deploy.sh
	exit
done

