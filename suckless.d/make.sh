#!/bin/bash

function version() {
	[ "$1" = "dmenu" ] && echo 5.2
	[ "$1" = "dwm" ] && echo 6.4
	[ "$1" = "st" ] && echo 0.9
	[ "$1" = "sxiv" ] && echo 24
}

function tarname() {
	[ "$1" = "dmenu" ] && echo dmenu-$(version dmenu).tar.gz
	[ "$1" = "dwm" ] && echo dwm-$(version dwm).tar.gz
	[ "$1" = "st" ] && echo st-$(version st).tar.gz
	[ "$1" = "sxiv" ] && echo v$(version sxiv).tar.gz
}

function url() {
	[ "$1" = "dmenu" ] && echo "dl.suckless.org/tools/$(tarname dmenu)"
	[ "$1" = "dwm" ] && echo "dl.suckless.org/dwm/$(tarname dwm)"
	[ "$1" = "st" ] && echo "dl.suckless.org/st/$(tarname st)"
	[ "$1" = "sxiv" ] && echo "github.com/xyb3rt/sxiv/archive/$(tarname sxiv)"
}

for i in dwm st dmenu sxiv; do
	rm -rf $i-$(version $i)\
		&& rm -rf $(tarname $i)\
		&& wget $(url $i)\
		&& tar xkf $(tarname $i)\
		&& cd $i-$(version $i)\
		&& patch -p1 < ../$i.diff\
		&& sudo make clean && make && sudo make install\
		&& cd ..\
		&& rm -rf $i-$(version $i)\
		&& rm -rf $(tarname $i)
done

