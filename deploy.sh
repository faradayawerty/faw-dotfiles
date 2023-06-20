#!/bin/bash

[ -n "$(command -v pacman)" ]\
	&& sudo pacman -Sy $(grep -Po '(?<=`)([a-z0-9-]+)(?=`)' README.md)

for i in $(ls -d *.d); do
	cd $i && ./deploy.sh && cd ..
done

