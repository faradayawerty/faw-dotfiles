#!/bin/bash
cd /tmp && git clone https://github.com/lecram/rover && cd rover
sudo make clean && make && sudo make install
cd .. && rm -rfv rover

