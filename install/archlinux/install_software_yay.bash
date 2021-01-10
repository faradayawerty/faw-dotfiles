# install pacman packages
yay -Syu --needed $(cat software.*.list | sed s/#.*// | sed /^$/d)

