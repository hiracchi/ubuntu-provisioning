#!/bin/bash

export LANG=C
export LC_ALL=C

# VERBOSE="-vvvv"
GROUP="all"
# USE_SSH_PASSWORD="-k -c paramiko"
# USE_SSH_PASSWORD="-k"
# USE_SSH_PRIVATEKEY="--private-key=~/.ssh/key.pem"
ASK_SUDO_PASS="--ask-become-pass"

# setup ssh-keys
#ansible-playbook ${VERBOSE} \
#                 -i hosts.setup-sshkeys \
#                 -c paramiko \
#                 --ask-pass \
#                 --ask-become-pass \
#                 -l ${GROUP} \
#                 setup-sshkeys.yaml \
#                 $*

# main
ansible-playbook ${VERBOSE} \
                 ${ASK_SUDO_PASS} \
                 -i th-j1800n.hosts \
                 -l ${GROUP} \
                 th-j1800n.yaml \
                 $*

