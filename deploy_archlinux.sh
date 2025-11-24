#!/bin/bash

# TODO add other distros (void, debian, slackware, gentoo, ...)

for i in $(ls -d *.d); do
	cd $i && ./deploy.sh "archlinux" && cd ..
done

