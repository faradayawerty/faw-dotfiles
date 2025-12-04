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

read -p "Pull fawm, fast and faxiv from github.com? [y/N] " ans
if [ "$ans" = "y" ]; then
	SRCDIR=~/.local/src/github.com/faradayawerty
	mkdir -p $SRCDIR
	cd $SRCDIR
	if ! [ -d $SRCDIR/fawm ]; then
		git clone https://github.com/faradayawerty/fawm
		cd fawm
		make clean && make && make install
		cd ..
	else
		read -p "fawm already pulled to $SRCDIR/fawm, do you want to recompile it? [y/N] " ans
		if [ "$ans" = "y" ]; then
			cd fawm
			make clean && make && make install
			cd ..
		fi
	fi
	if ! [ -d $SRCDIR/fast ]; then
		git clone https://github.com/faradayawerty/fast
		cd fast
		make clean && make && make install
		cd ..
	else
		read -p "fast already pulled to $SRCDIR/fast, do you want to recompile it? [y/N] " ans
		if [ "$ans" = "y" ]; then
			cd fast
			make clean && make && make install
			cd ..
		fi
	fi
	if ! [ -d $SRCDIR/faxiv ]; then
		git clone https://github.com/faradayawerty/faxiv
		cd faxiv
		make clean && make && make install
	else
		read -p "faxiv already pulled to $SRCDIR/faxiv, do you want to recompile it? [y/N] " ans
		if [ "$ans" = "y" ]; then
			cd faxiv
			make clean && make && make install
			cd ..
		fi
	fi
fi

