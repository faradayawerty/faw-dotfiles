#!/bin/bash

[ -d ~/.local/share/st-faw-patch ]\
	&& rm -r ~/.local/share/st-faw-patch

patch_path=$(realpath st-faw-patch.diff)\
	&& mkdir -p ~/.local/share/st-faw-patch/\
	&& cd ~/.local/share/st-faw-patch/\
	&& aria2c https://dl.suckless.org/st/st-0.9.3.tar.gz\
	&& tar xf st-0.9.3.tar.gz\
	&& cp -r st-0.9.3 st-0.9.3-patched\
	&& cd st-0.9.3\
	&& patch -p1 < $patch_path\
	&& make\
	&& make install\
	&& make clean

