#!/bin/bash

export SHELL=bash
export EDITOR=vis
export PAGER=w3m
export DOWNLOADER=wget
export RSS_READER=newsboat
export TERMINAL_BROWSER=w3m
export MUSIC_PLAYER=cmus
export FILE_MANAGER=nnn

export MENU=dmenu
export TERMINAL=st
export BROWSER=chromium
export IMAGE_VIEWER=sxiv

export GOPATH=~/.go

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$GOPATH/bin" ] ; then
    PATH="$GOPATH/bin:$PATH"
fi

# autostart x
if [ -f ~/.xinitrc ] && systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]] && [ -z $TMUX ]; then
    exec startx
fi

