#!/usr/bin/env bash

SOURCE="${BASH_SOURCE[0]}"
RDIR="$( dirname "$SOURCE" )"
#SUDO=`which sudo 2> /dev/null`
SUDO=""
SUDO_OPTION="--sudo"
OS_TYPE=${1:-}
OS_VERSION=${2:-}
ANSIBLE_VERSION=${3:-}
echo "============= RUN TESTS FOR: =============================="
echo "              ${OS_TYPE} ${OS_VERSION} ${ANSIBLE_VERSION}"
echo "==========================================================="

################
# there is error with docker + SystemD:
#   https://github.com/ansible/ansible-modules-core/issues/593#issuecomment-144725409
# So for now I disabled SystemD on specified OS versions
##############
DISABLED_SYSTEMD="no"

ANSIBLE_VAR=""
ANSIBLE_INVENTORY="tests/inventory"
ANSIBLE_PLAYBOOk="tests/test.yml"
ANSIBLE_PREPARATION_PLAYBOOk="tests/prepare.yml"
#ANSIBLE_LOG_LEVEL="-vvv"
ANSIBLE_LOG_LEVEL=""

function test_playbook(){
    echo  ">>>started: Idempotence test"

    # first run
    ansible-playbook -i ${ANSIBLE_INVENTORY}  --connection=local $SUDO_OPTION $ANSIBLE_EXTRA_VARS $ANSIBLE_LOG_LEVEL  ${ANSIBLE_PLAYBOOk} || ( echo "first run was failed" && exit 2 )

    # Run the role/playbook again, checking to make sure it's idempotent.
    ansible-playbook -i ${ANSIBLE_INVENTORY} --connection=local $SUDO_OPTION $ANSIBLE_EXTRA_VARS $ANSIBLE_LOG_LEVEL ${ANSIBLE_PLAYBOOk} | grep -q 'changed=0.*failed=0' && (echo 'Idempotence test: pass' ) || (echo 'Idempotence test: fail' && exit 1)
}

function main(){
    test_playbook

}

################ run #########################
main