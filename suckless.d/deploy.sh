#!/bin/bash

# download, patch and build suckless tools

function template {

	font="Hack-Regular:size=12"

	foreground=ffffff
	background=000000
	black=111111
	black_bright=666666
	red=d36265
	red_bright=ef8171
	green=aece91
	green_bright=cfefb3
	yellow=e7e18c
	yellow_bright=fff796
	blue=5297cf
	blue_bright=74b8ef
	magenta=963c59
	magenta_bright=b85e7b
	cyan=5e7175
	cyan_bright=a3babf
	white=bebebe
	white_bright=ffffff

	sed\
		-e "s/TEMPLATE_FONT/$font/g"\
		-e "s/TEMPLATE_BACKGROUND/#$background/g"\
		-e "s/TEMPLATE_FOREGROUND/#$foreground/g"\
		-e "s/TEMPLATE_BLACK_BRIGHT/#$black_bright/g"\
		-e "s/TEMPLATE_RED_BRIGHT/#$red_bright/g"\
		-e "s/TEMPLATE_GREEN_BRIGHT/#$green_bright/g"\
		-e "s/TEMPLATE_YELLOW_BRIGHT/#$yellow_bright/g"\
		-e "s/TEMPLATE_BLUE_BRIGHT/#$blue_bright/g"\
		-e "s/TEMPLATE_MAGENTA_BRIGHT/#$magenta_bright/g"\
		-e "s/TEMPLATE_CYAN_BRIGHT/#$cyan_bright/g"\
		-e "s/TEMPLATE_WHITE_BRIGHT/#$white_bright/g"\
		-e "s/TEMPLATE_BLACK/#$black/g"\
		-e "s/TEMPLATE_RED/#$red/g"\
		-e "s/TEMPLATE_GREEN/#$green/g"\
		-e "s/TEMPLATE_YELLOW/#$yellow/g"\
		-e "s/TEMPLATE_BLUE/#$blue/g"\
		-e "s/TEMPLATE_MAGENTA/#$magenta/g"\
		-e "s/TEMPLATE_CYAN/#$cyan/g"\
		-e "s/TEMPLATE_WHITE/#$white/g"\
		$1
}

function version {
	case "$1" in
		"dmenu") echo 5.2 ;;
		"dwm") echo 6.4 ;;
		"st") echo 0.9 ;;
		"sxiv") echo 24 ;;
	esac
}

function tarname {
	case "$1" in
		"dmenu") echo dmenu-$(version dmenu).tar.gz ;;
		"dwm") echo dwm-$(version dwm).tar.gz ;;
		"st") echo st-$(version st).tar.gz ;;
		"sxiv") echo v$(version sxiv).tar.gz ;;
	esac
}

function url {
	case "$1" in
		"dmenu") echo "dl.suckless.org/tools/$(tarname dmenu)" ;;
		"dwm") echo "dl.suckless.org/dwm/$(tarname dwm)" ;;
		"st") echo "dl.suckless.org/st/$(tarname st)" ;;
		"sxiv") echo "github.com/xyb3rt/sxiv/archive/$(tarname sxiv)" ;;
	esac
}

for i in dmenu dwm st sxiv; do
	rm -rf $i-$(version $i)\
		&& rm -rf $(tarname $i)\
		&& wget $(url $i)\
		&& tar xkf $(tarname $i)\
		&& cd $i-$(version $i)\
		&& template ../$i.diff.template | patch -p1\
		&& sudo make clean && make && sudo make install\
		&& cd ..\
		&& rm -rf $i-$(version $i)\
		&& rm -rf $(tarname $i)
done

