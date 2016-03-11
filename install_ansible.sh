#!/bin/bash

install_ansible_system()
{
    sudo apt-get install software-properties-common
    sudo apt-add-repository ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get install ansible
}

install_ansible_current()
{
    pip install --upgrade --user git+https://github.com/ansible/ansible.git
    pip install --upgrade --user passlib
}

install_ansible_current()

