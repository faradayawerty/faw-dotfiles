#!/bin/bash

source ~/.bashrc

export EDITOR=vim
export GOPATH=~/.go

if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi

if [ -f ~/.xinitrc ] && [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] && [[ -z "$TMUX" ]]; then
	exec startx
fi

