#!/bin/bash

curl https://dl.suckless.org/dwm/dwm-6.4.tar.gz -o dwm-6.4.tar.gz\
	&& tar xf dwm-6.4.tar.gz && cd dwm-6.4

patch -p1 < ../dwm.diff\
	&& sudo make clean && make && sudo make install

cd ..\
	&& rm -rv dwm-6.4 dwm-6.4.tar.gz

