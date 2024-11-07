#!/bin/bash

VERSION=0.9

curl https://dl.suckless.org/st/st-$VERSION.tar.gz -o st-$VERSION.tar.gz\
	&& tar xf st-$VERSION.tar.gz && cd st-$VERSION

patch -p1 < ../st.diff\
	&& sudo make clean && make && sudo make install

cd ..\
	&& rm -rv st-$VERSION st-$VERSION.tar.gz

