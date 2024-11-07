#!/bin/bash

select wm in dwm fvwm none; do
	[ "$wm" = "none" ] && exit
	cd $wm
	./deploy.sh
	exit
done

