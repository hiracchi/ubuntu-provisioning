#!/bin/bash
# VERBOSE="-vvvv"
GROUP="all"
# GROUP="apt-mirror-server"
# USE_SSH_PASSWORD="-k -c paramiko"
# USE_SSH_PASSWORD="-k"
# USE_SSH_PRIVATEKEY="--private-key=~/.ssh/key.pem"

# setup ssh-keys
ansible-playbook ${VERBOSE} \
                 -i hosts.setup-sshkeys \
                 -c paramiko \
                 --ask-pass \
                 --ask-become-pass \
                 -l ${GROUP} \
                 setup-sshkeys.yaml \
                 $*

# main
ansible-playbook ${VERBOSE} \
                 -i hosts \
                 -l ${GROUP} \
                 ubuntu-basics.yaml \
                 $*

