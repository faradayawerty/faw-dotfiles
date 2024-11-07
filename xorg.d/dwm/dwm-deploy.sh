#!/bin/bash

VERSION=6.4

curl https://dl.suckless.org/dwm/dwm-$VERSION.tar.gz -o dwm-$VERSION.tar.gz\
	&& tar xf dwm-$VERSION.tar.gz && cd dwm-$VERSION

patch -p1 < ../dwm.diff\
	&& sudo make clean && make && sudo make install

cd ..\
	&& rm -rv dwm-$VERSION dwm-$VERSION.tar.gz

