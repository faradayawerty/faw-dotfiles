# install apt packages
sudo apt update
sudo apt install $(sed s/#.*// software.apt.list | sed /^$/d)

