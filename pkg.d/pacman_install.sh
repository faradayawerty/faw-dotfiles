#!/bin/bash

sudo pacman -Syu $(cat pacman_packages.txt)

read -p "Install yay? [y/N] " ans
if [ "$ans" = "y" ]; then
	cd /tmp
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
fi

