#!/bin/bash
ADDRESS="125.212.205.1"
USERNAME="t1-vq2-dev"
PASSWORD_FILE="./vpn-password.txt"
PROTOCOL="gp"

function getPID(){
    PID=$(pidof openconnect)
    echo $PID
}

function startOC(){
    sudo openconnect -u ${USERNAME} --passwd-on-stdin ${ADDRESS} --protocol=${PROTOCOL} < ${PASSWORD_FILE} 
}

startOC

while true
do
    sleep 5
    if [ -z "$(getPID)" ] ; then
        startOC
    fi
done
