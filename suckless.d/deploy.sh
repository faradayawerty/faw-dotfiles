#!/bin/bash

# download, patch and build suckless tools

font="Hack-Regular:size=12"
colors="#111111 #d36265 #aece91 #e7e18c #5297cf #963c59 #5e7175 #bebebe\
	#666666 #ef8171 #cfefb3 #fff796 #74b8ef #b85e7b #a3babf #ffffff"

function template {
	sed\
		-e "s/TEMPLATE_FONT/$font/g"\
		-e "s/TEMPLATE_BACKGROUND/$(echo $colors | cut -d' ' -f1)/g"\
		-e "s/TEMPLATE_FOREGROUND/$(echo $colors | cut -d' ' -f8)/g"\
		-e "s/TEMPLATE_BLACK_BRIGHT/$(echo $colors | cut -d' ' -f9)/g"\
		-e "s/TEMPLATE_RED_BRIGHT/$(echo $colors | cut -d' ' -f10)/g"\
		-e "s/TEMPLATE_GREEN_BRIGHT/$(echo $colors | cut -d' ' -f11)/g"\
		-e "s/TEMPLATE_YELLOW_BRIGHT/$(echo $colors | cut -d' ' -f12)/g"\
		-e "s/TEMPLATE_BLUE_BRIGHT/$(echo $colors | cut -d' ' -f13)/g"\
		-e "s/TEMPLATE_MAGENTA_BRIGHT/$(echo $colors | cut -d' ' -f14)/g"\
		-e "s/TEMPLATE_CYAN_BRIGHT/$(echo $colors | cut -d' ' -f15)/g"\
		-e "s/TEMPLATE_WHITE_BRIGHT/$(echo $colors | cut -d' ' -f16)/g"\
		-e "s/TEMPLATE_BLACK/$(echo $colors | cut -d' ' -f1)/g"\
		-e "s/TEMPLATE_RED/$(echo $colors | cut -d' ' -f2)/g"\
		-e "s/TEMPLATE_GREEN/$(echo $colors | cut -d' ' -f3)/g"\
		-e "s/TEMPLATE_YELLOW/$(echo $colors | cut -d' ' -f4)/g"\
		-e "s/TEMPLATE_BLUE/$(echo $colors | cut -d' ' -f5)/g"\
		-e "s/TEMPLATE_MAGENTA/$(echo $colors | cut -d' ' -f6)/g"\
		-e "s/TEMPLATE_CYAN/$(echo $colors | cut -d' ' -f7)/g"\
		-e "s/TEMPLATE_WHITE/$(echo $colors | cut -d' ' -f8)/g"\
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

#[ -n "$(command -v schemer2)" ] && [ -f "../xorg.d/wallpaper.jpg" ] &&\
#	colors="$(schemer2 -format img::colors -in ../xorg.d/wallpaper.jpg)"

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

