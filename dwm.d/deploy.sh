#!/bin/bash

for i in wallpaper.jpg xbindkeysrc xinitrc Xresources; do
	ln -snf $(realpath $i) ~/.$(basename $i)
done

dwm_patch_path=$(realpath wm.diff)\
	&& cd /tmp\
	&& rm -rf dwm-6.4\
	&& rm -rf dwm-6.4.tar.gz\
	&& curl dl.suckless.org/dwm/dwm-6.4.tar.gz -o dwm-6.4.tar.gz\
	&& tar xkf dwm-6.4.tar.gz\
	&& cd dwm-6.4\
	&& patch -p1 < $dwm_patch_path\
	&& sudo make clean && make && sudo make install\
	&& cd ..\
	&& rm -rf dwm-6.4\
	&& rm -rf dwm-6.4.tar.gz

