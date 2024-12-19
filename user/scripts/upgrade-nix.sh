#!/usr/bin/env bash

set -eEuo pipefail

ensure-environment

cd $MY_NIXOS_CONFIG_DIRECTORY

set -x

nix flake update
sudo nixos-rebuild switch --upgrade-all --flake .#$MY_NIXOS_HOST