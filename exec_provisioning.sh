#!/bin/bash

VERBOSE="-vvvv"
GROUP="vagrant"

# setup admin env
setup_admin()
{
    echo "setup admin ..."
    ansible-playbook ${VERBOSE} \
        -i admin.hosts \
        ${ASK_BECOME_PASS} \
        -l ${GROUP} \
        admin.yaml \
        $*
    echo
}

do_provisioning()
{
    echo "provisioning ..."
    ansible-playbook ${VERBOSE} \
        -i ubuntu-basics.hosts \
        --ask-vault-pass \
        ${ASK_BECOME_PASS} \
        -l ${GROUP} \
        ubuntu-basics.yaml \
        $*
    echo "done."
}


# main
ansible -i ubuntu-basics.hosts --ask-vault-pass -a "uptime" ${GROUP} 2>&1 > /dev/null || setup_admin
do_provisioning

