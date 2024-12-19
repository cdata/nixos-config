#!/usr/bin/env bash

set -eEuo pipefail

ensure-environment

cd $MY_NIXOS_CONFIG_DIRECTORY

set -x

sudo nixos-rebuild switch --flake .#$MY_NIXOS_HOST