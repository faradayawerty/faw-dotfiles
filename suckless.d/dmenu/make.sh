#!/bin/bash
version=5.2\
	&& curl -o dmenu-$version.tar.gz dl.suckless.org/tools/dmenu-$version.tar.gz\
	&& tar xkf dmenu-$version.tar.gz && cd dmenu-$version
patch -p1 < ../dmenu-faw-20230608.diff\
	&& sudo make clean && make && sudo make install
cd .. && rm -rf dmenu-$version && rm -rf dmenu-$version.tar.gz

