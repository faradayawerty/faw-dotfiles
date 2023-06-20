#!/bin/bash

mkdir -p ~/.local/bin
mkdir -p ~/.local/share
mkdir -p ~/.config/sxiv/exec

for i in $(ls bin); do
	ln -snf $(realpath bin/$i) ~/.local/bin/$i
done

for i in $(ls share); do
	ln -snf $(realpath share/$i) ~/.local/share/$i
done

ln -snf ~/.local/bin/faw_sxiv_keyhandler ~/.config/sxiv/exec/key-handler

