#!/bin/bash

curl https://dl.suckless.org/st/st-0.9.tar.gz -o st-0.9.tar.gz\
	&& tar xf st-0.9.tar.gz && cd st-0.9

patch -p1 < ../st.diff\
	&& sudo make clean && make && sudo make install

cd ..\
	&& rm -rv st-0.9 st-0.9.tar.gz

