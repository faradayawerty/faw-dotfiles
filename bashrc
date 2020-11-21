#!/bin/bash

# --- VARS --- #
    # don't put duplicate lines or lines starting with space in the history.
    HISTCONTROL=ignoreboth

    # for setting history length see HISTSIZE and HISTFILESIZE
    HISTSIZE=1000
    HISTFILESIZE=1000

# --- PROMPT --- #
	PS1='\[\e[0;1;34m\]\u\[\e[0;1;36m\]@\[\e[0;1;34m\]\H\[\e[m\] \[\e[0;1;35m\]\W\[\e[m\] \[\e0'

# --- OPTIONS --- #
    # append to the history file, don't overwrite it
    shopt -s histappend

    # check the window size after each command and, if necessary,
    # update the values of LINES and COLUMNS.
    shopt -s checkwinsize

    # cd into directory by typing its name
    #shopt -s autocd

    # disable ctrl+s, ctrl+q
    stty -ixon

    # vi mode
    #set -o vi
    #bind -m vi-insert "\C-l":clear-screen

# --- ALIASES --- #
    # enable color support of ls and also add handy aliases
    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls --color=auto'
        alias grep='grep --color=auto'
    fi

    alias l='ls -Fh --color=auto --group-directories-first'
    alias ll='clear;ls -lFh --color=auto --group-directories-first'
    alias la='ls -aFh --color=auto --group-directories-first'
    alias lla='clear;ls -laFh --color=auto --group-directories-first'

	alias ydurls="$EDITOR ~/.local/share/downloadstuff/youtube-download"
    alias yd240='youtube-dl --add-metadata -ic -f "bestvideo[height<=240]+bestaudio/best[height<=240]"'
    alias yd360='youtube-dl --add-metadata -ic -f "bestvideo[height<=360]+bestaudio/best[height<=360]"'
    alias yd480='youtube-dl --add-metadata -ic -f "bestvideo[height<=480]+bestaudio/best[height<=480]"'
    alias yd720='youtube-dl --add-metadata -ic -f "bestvideo[height<=720]+bestaudio/best[height<=720]"'

    alias mpv720='mpv --geometry=25%x25%-10-10 --ytdl-format="bestvideo[height<=?720]+bestaudio/best"'
    alias mpv480='mpv --geometry=25%x25%-10-10 --ytdl-format="bestvideo[height<=?480]+bestaudio/best"'
    alias mpv360='mpv --geometry=25%x25%-10-10 --ytdl-format="bestvideo[height<=?360]+bestaudio/best"'
    alias mpv240='mpv --geometry=25%x25%-10-10 --ytdl-format="bestvideo[height<=?240]+bestaudio/best"'

    alias ww="$BROWSER https://duckduckgo.com/html"
    alias wt="torsocks $BROWSER https://3g2upl4pq6kufc4m.onion/html"

    alias tmd='tmux new-session -A -s default'
    alias tmt='tmux new-session -A -s tty'
    alias tms='tmux new-session -A -s ssh'

    alias p='clear; python3 -ic "from math import *"'
    alias nf='clear; neofetch'
    alias nb=newsboat

    alias mn='udisksctl mount -b'
    alias um='udisksctl unmount -b'

    # creating files
	alias todo-new='echo -e "$(for i in $(seq -w 00 23)
		do
			for j in 00 20 40
			do
				echo $i:$j
			done
		done)"'
	alias cpp-new='echo -e "#include <cstdio>\n\nint main()\n{\n\treturn 0;\n}\n"'

# --- FUNCTIONS --- #
    function cd {
        builtin cd "$@" && l
    }

# --- MISC --- #
    # enable programmable completion features
    if ! shopt -oq posix; then
      if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
      elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
      fi
    fi
