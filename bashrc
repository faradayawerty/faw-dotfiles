#!/bin/bash

# --- VARS --- #
    # don't put duplicate lines or lines starting with space in the history.
    HISTCONTROL=ignoreboth

    # for setting history length see HISTSIZE and HISTFILESIZE
    HISTSIZE=1000
    HISTFILESIZE=1000

# --- PROMPT --- #
    PS1='\[\e[0;1;34m\]\u\[\e[0;1;36m\]@\[\e[0;1;34m\]\H\[\e[m\] \[\e[0;1;36m\]\W\[\e[m\] \[\e0'

# --- OPTIONS --- #
    # append to the history file, don't overwrite it
    shopt -s histappend

    # check the window size after each command and, if necessary,
    # update the values of LINES and COLUMNS.
    shopt -s checkwinsize

    # disable ctrl+s, ctrl+q
    stty -ixon

    # cd into directory by typing its name
    #shopt -s autocd

    # vi mode
    #set -o vi
    #bind -m vi-insert "\C-l":clear-screen

# --- ALIASES --- #
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

    alias yt240='pipe-viewer --resolution 240'
    alias yt360='pipe-viewer --resolution 360'
    alias yt480='pipe-viewer --resolution 480'
    alias yt720='pipe-viewer --resolution 720'

    alias tm='tmux new-session -A -s'
    alias nb='newsboat'
    alias ht='htop'
    alias pm='pulsemixer'
    alias nf='clear; neofetch'
    alias ww='w3m -B'
    alias wt='torsocks w3m -B'
    alias mn='udisksctl mount -b'
    alias um='udisksctl unmount -b'


# --- FUNCTIONS --- #
    function cd {
        builtin cd "$@" && l
    }

    function aur {
        git clone https://aur.archlinux.org/$1.git
    }

