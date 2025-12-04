#!/bin/bash

distro="$@"

mkdir -p ~/.config/sxiv/exec/
mkdir -p ~/Pictures/

ln -snf $(realpath xinitrc) ~/.xinitrc
ln -snf $(realpath xbindkeysrc) ~/.xbindkeysrc
ln -snf $(realpath wallpaper.jpg) ~/.wallpaper.jpg
ln -snf $(realpath sxiv_keyhandler) ~/.config/sxiv/exec/key-handler
ln -snf $(realpath wallpapers) ~/Pictures/wallpapers

