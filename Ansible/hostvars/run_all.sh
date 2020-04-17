#!/usr/bin/env bash

function stage() {
    COLOR="\e[95m"
    RESET="\e[0m"
    msg="$1"
    
    echo
    echo -e "$COLOR$msg$RESET"
}

function checkPrerequsites() {
    stage "Checking prerequisites"

    command ansible --version > /dev/null 2>&1
    [[ $? != 0 ]] && echo "You need to install ansible to run this example" && exit 1

    echo "OK"
}

function runAnsible() {
    stage "Running ansible"

    ansible-playbook \
        -i inventory.ini \
        playbook.yml
}

checkPrerequsites
runAnsible