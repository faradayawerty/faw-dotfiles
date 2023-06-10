#!/bin/bash
version=6.4 && rm -rf dwm-$version && rm -rf dwm-$version.tar.gz\
	&& wget dl.suckless.org/dwm/dwm-$version.tar.gz && tar xkf dwm-$version.tar.gz && cd dwm-$version
patch -p1 < ../dwm-faw-20230608.diff\
	&& sudo make clean && make && sudo make install
cd .. && rm -rf dwm-$version && rm -rf dwm-$version.tar.gz

