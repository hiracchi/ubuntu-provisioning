#!/bin/bash

install_ansible_system()
{
    sudo apt-get install software-properties-common
    sudo apt-add-repository ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get install ansible
}

install_pip()
{
    wget -o get-pip.py "https://bootstrap.pypa.io/get-pip.py"
    python get-pip.py --user
}

install_ansible_current()
{
    ~/.local/bin/pip install --upgrade --user git+https://github.com/ansible/ansible.git
    ~/.local/bin/pip pip install --upgrade --user passlib
}

# install_pip
install_ansible_current

