#!/bin/bash

sudo pacman -Syu $(cat pacman_packages.txt)

read -p "Install yay? [y/N] " ans
if [ "$ans" = "y" ]; then
	cd /tmp
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
fi

read -p "Pull fawm, fast and faxiv from github.com? [y/N] " ans
if [ "$ans" = "y" ]; then
	mkdir -p ~/Downloads/github.com/faradayawerty/
	cd ~/Downloads/github.com/faradayawerty/
	[ -d ~/Downloads/github.com/faradayawerty/fawm ] || git clone https://github.com/faradayawerty/fawm
	cd fawm
	sudo make clean && make && sudo make install
	cd ..
	[ -d ~/Downloads/github.com/faradayawerty/fast ] || git clone https://github.com/faradayawerty/fast
	cd fast
	sudo make clean && make && sudo make install
	cd ..
	[ -d ~/Downloads/github.com/faradayawerty/faxiv ] || git clone https://github.com/faradayawerty/faxiv
	cd faxiv
	sudo make clean && make && sudo make install
fi

