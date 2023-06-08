#!/bin/bash
version=0.9\
	&& curl -o st-$version.tar.gz dl.suckless.org/st/st-$version.tar.gz\
	&& tar xkf st-$version.tar.gz && cd st-$version
patch -p1 < ../st-faw-20230608.diff\
	&& sudo make clean && make && sudo make install
cd .. && rm -rf st-$version st-$version.tar.gz

