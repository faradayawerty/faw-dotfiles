#!/bin/bash

mkdir -p ~/.fvwm

for i in config images; do
	ln -snf $(realpath $i) ~/.fvwm/$i
done

