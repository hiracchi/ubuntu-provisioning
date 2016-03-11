#!/bin/bash

if [ ! -x brew ]; then
    sudo apt-get install -y build-essential curl git python-setuptools ruby libncurses-dev
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/linuxbrew/go/install)"
fi


