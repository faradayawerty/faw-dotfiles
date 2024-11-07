#!/bin/bash

for i in xbindkeysrc; do
	ln -snf $(realpath $i) ~/.$(basename $i)
done

for i in dwm st; do
	./$i-deploy.sh
done

