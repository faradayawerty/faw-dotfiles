#!/bin/bash

mkdir -p ~/.config/vis\
	&& ln -snf $(realpath visrc.lua) ~/.config/vis/visrc.lua

for i in visrc.lua bashrc bash_profile tmux.conf; do
	ln -snf $(realpath $i) ~/.$(basename $i)
done

