#!/bin/bash

[ -n "$(command -v pacman)" ]\
	&& sudo pacman -Sy $(grep -Po '(?<=`)([a-z0-9-]+)(?=`)' README.md)

cd suckless.d && ./deploy.sh && cd ..
cd local.d && ./deploy.sh && cd ..

for i in $(ls -d unix.d/* xorg.d/*); do
	ln -snf $(realpath $i) ~/.$(basename $i)
done

curl -fLo ~/.vim/autoload/plug.vim\
	--create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim\
	--silent

