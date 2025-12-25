#!/bin/bash

[ -d ~/.local/share/dwm-faw-patch ]\
	&& rm -r ~/.local/share/dwm-faw-patch

patch_path=$(realpath dwm-faw-patch.diff)\
	&& mkdir -p ~/.local/share/dwm-faw-patch/\
	&& cd ~/.local/share/dwm-faw-patch/\
	&& aria2c https://dl.suckless.org/dwm/dwm-6.6.tar.gz\
	&& tar xf dwm-6.6.tar.gz\
	&& cp -r dwm-6.6 dwm-6.6-patched\
	&& cd dwm-6.6-patched\
	&& patch -p1 < $patch_path\
	&& make\
	&& make install

