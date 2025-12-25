#!/bin/bash

[ -d ~/.local/share/dwm-faw-patch ]\
	&& echo dwm already deployed at ~/.local/share/dwm-faw-patch\
	&& exit

patch_path=$(realpath dwm-faw-patch.diff)\
	&& mkdir -p ~/.local/share/dwm-faw-patch/\
	&& cd ~/.local/share/dwm-faw-patch/\
	&& aria2c https://dl.suckless.org/dwm/dwm-6.6.tar.gz\
	&& tar xf dwm-6.6.tar.gz\
	&& cd dwm-6.6\
	&& patch -p1 < $patch_path\
	&& make\
	&& make install

