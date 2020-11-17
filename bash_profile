#!/bin/bash

export GOPATH=~/.go

export SHELL=bash
export EDITOR=vim
export PAGER=w3m
export BROWSER=w3m
export MUSIC_PLAYER=cmus
export FILE_MANAGER=ranger
export DOWNLOADER=wget

export GUI_BROWSER=qutebrowser
export TERMINAL=xterm
#export MEDIA_VIEWER='mpv --ytdl-format="bestvideo[height<=?360]+bestaudio/best"'
export IMAGE_VIEWER=sxiv

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

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

