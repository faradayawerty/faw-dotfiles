# install pacman packages
pkg install $(sed s/#.*// software.pkg.list | sed /^$/d)

