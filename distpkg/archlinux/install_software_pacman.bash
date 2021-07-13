# install pacman packages
sudo pacman -Syu --needed $(sed s/#.*// software.pacman.list | sed /^$/d)

