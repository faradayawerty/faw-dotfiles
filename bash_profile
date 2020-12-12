#!/bin/bash

source ~/.bashrc

export SHELL=bash
export EDITOR=kak

export PAGER=w3m
export DOWNLOADER=aria2c
export TERMINAL_BROWSER=w3m
export FILE_MANAGER=lf
export NEWS_READER=newsboat

export MEDIA_PLAYER=mpv
export IMAGE_VIEWER=sxiv
export DOCUMENT_VIEWER=xreader

export MENU=dmenu
export TERMINAL=st
export BROWSER=chromium

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

