#!/bin/bash
version=24 && rm -rf sxiv-$version && rm -rf v$version.tar.gz\
	&& wget github.com/xyb3rt/sxiv/archive/v$version.tar.gz && tar xkf v$version.tar.gz && cd sxiv-$version
patch -p1 < ../sxiv-faw-20230609.diff\
	&& sudo make clean && make && sudo make install
cd .. && rm -rf sxiv-$version && rm -rf v$version.tar.gz

