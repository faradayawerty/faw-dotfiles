#!/bin/bash

for i in bashrc bash_profile tmux.conf vimrc htoprc; do
	ln -snf $(realpath $i) ~/.$(basename $i)
done

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

