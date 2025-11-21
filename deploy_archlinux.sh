#!/bin/bash
for i in $(ls -d *.d); do
	cd $i && ./deploy.sh "archlinux" && cd ..
done

