#!/usr/bin/env bash

[[ $EUID != 0 ]] && {
    echo "please run with sudo or root user"
    echo "ex: sudo ${0}"
    exit 1
}

cp update-docker.sh /usr/bin/update-discord

echo Installation complete
echo just run \"sudo update-discord\" when it says its your luck day
