#!/bin/bash
set -o errexit
set -o nounset

sudo apt install python3-pip

wget https://github.com/joan2937/pigpio/archive/master.zip
unzip master.zip

(cd pigpio-master
	make
	sudo make install
)
