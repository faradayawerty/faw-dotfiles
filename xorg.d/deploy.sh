#!/bin/bash

ln -snf $(realpath xinitrc) ~/.xinitrc
ln -snf $(realpath xbindkeysrc) ~/.xbindkeysrc

#mkdir -p ~/.config/sxiv/exec/
#ln -snf $(realpath sxiv_keyhandler) ~/.config/sxiv/exec/key-handler

