#!/bin/bash

# VERBOSE="-vvvv"
GROUP="th-work"
# DRY_RUN="-C"
ASK_PASS="--ask-pass -c paramiko"
ASK_VAULT_PASS="--ask-vault-pass"

check_connect()
{
    echo "checking connection using ssh..."
    ansible -i ubuntu-basics.hosts \
        ${ASK_VAULT_PASS} \
        -a "uptime" ${GROUP} 2>&1 > /dev/null
    return $?
}

initialize()
{
    echo "initialize ..."
    ansible-playbook \
        ${VERBOSE} ${DRY_RUN} \
        ${ASK_PASS} \
        ${ASK_VAULT_PASS} \
        -i init.hosts \
        ${ASK_BECOME_PASS} \
        -l ${GROUP} \
        init.yaml \
        $*
    echo
}

do_provisioning()
{
    echo "provisioning ..."
    ansible-playbook \
        ${VERBOSE} ${DRY_RUN} \
        ${ASK_VAULT_PASS} \
        -i ubuntu-basics.hosts \
        ${ASK_BECOME_PASS} \
        -l ${GROUP} \
        ubuntu-basics.yaml \
        $*
    echo "done."
}


# main
check_connect || initialize
do_provisioning

