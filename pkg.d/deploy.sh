#!/bin/bash

distro="$@"

if [ "$distro" = "archlinux" ]; then
	sudo pacman -Syu $(cat pacman_packages.txt)
	read -p "Install yay? [y/N] " ans
	if [ "$ans" = "y" ]; then
		cd /tmp
		git clone https://aur.archlinux.org/yay.git
		cd yay
		makepkg -si
	fi
fi

read -p "Install suckless software (st, dwm) as user? [y/N] " ans
if [ "$ans" = "y" ]; then
	cd suckless.org
	./deploy_dwm.sh
	./deploy_st.sh
fi

