#!/usr/bin/env bash

if [ -z ${MY_NIXOS_CONFIG_DIRECTORY+x} ]; then
    echo "CANNOT DO: the variable MY_NIXOS_CONFIG_DIRECTORY must be set!"
    exit 1
fi

if [ -z ${MY_NIXOS_HOST+x} ]; then
    echo "CANNOT DO: The variable MY_NIXOS_HOST must be set!"
    exit 1
fi
