#!/bin/bash

ln -snf $(realpath xinitrc) ~/.xinitrc
ln -snf $(realpath xbindkeysrc) ~/.xbindkeysrc
ln -snf $(realpath wallpaper.jpg) ~/.wallpaper.jpg
ln -snf $(realpath xresources) ~/.Xresources

mkdir -p ~/.config/sxiv/exec/
ln -snf $(realpath sxiv_keyhandler) ~/.config/sxiv/exec/key-handler

