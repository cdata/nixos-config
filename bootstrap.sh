#!/usr/bin/env bash

set -euo pipefail

set_variables() {
    # Config
    CONFIG_ROOT=$HOME/Git/github.com/cdata/nixos-config
    CONFIG_REPO=https://github.com/cdata/nixos-config

    # Colors
    NORMAL=$(tput sgr0)
    WHITE=$(tput setaf 7)
    BLACK=$(tput setaf 0)
    RED=$(tput setaf 1)
    GREEN=$(tput setaf 2)
    YELLOW=$(tput setaf 3)
    BLUE=$(tput setaf 4)
    MAGENTA=$(tput setaf 5)
    CYAN=$(tput setaf 6)
    BRIGHT=$(tput bold)
    UNDERLINE=$(tput smul)
}

clone() {
    repo=$1
    destination=$2

    set -e

    if [[ ! -d $destination ]]; then
        echo "Cloning $repo to $destination..."
        mkdir -p $destination
        git clone $repo $destination
    elif [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]]; then
        echo "Dotfile repository has a dirty working tree; aborting sync!"
        exit 1
    else
        echo "Syncing git repository at $destination..."
        pushd $destination
        git fetch
        git rebase origin/master
        popd
    fi

    set +e
}

confirm() {
    echo -en "[${GREEN}y${NORMAL}/${RED}n${NORMAL}]: "
    read -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        exit 0
    fi
}

make_directory() {
    destination=$1
    echo -e "Making ${MAGENTA}${destination}${NORMAL}"
    mkdir -p $destination
}

select_host() {
    hosts=(
        "Framework 16 7940 aka '[${YELLOW}d${NORMAL}]istortion'"
        "Custom Desktop aka '[${YELLOW}c${NORMAL}]ontradiction'"
    )

    echo -e "Available host configurations include:\n"

    for host in "${hosts[@]}"; do
        echo -e "- $host"
    done

    echo
    echo -en "Choose a ${GREEN}host${NORMAL}: ${YELLOW}"
    read -n 1 -r
    echo

    if [[ $REPLY =~ ^[Dd]$ ]]; then
        HOST='framework-16-7940'
    elif [[ $REPLY =~ ^[Cc]$ ]]; then
        HOST='custom-desktop-contradiction'
    else
        echo "${NORMAL}Invalid choice!"
        exit 1
    fi
    
    echo
    echo -en "${NORMAL}Ready to bootstrap with the ${YELLOW}'${HOST}'${NORMAL} ${GREEN}host${NORMAL} configuration? "
    confirm
}


print_header() {
    # echo -Ee "$CYAN$(cat ./magician.txt)\n\n$NORMAL"
    echo -en "$CYAN"
    cat <<'HEADER'


                       ,
                      /|
                     /*|         
       . ~ ☀        /.+|      🜂
       ( + )       /* .|
      ☽  ~ '       |:+.:\         
                   /+.:*.\     🜁
                  |:.*.:+|      
                 /+.---.Z\      
               ,(((/o^o\))\     🜄
              (())) ' > ()))       
              )(())(/~\))))(
             /((()'`))((()(\)      🜃
            /::)).&& (()))():\
           /:*::)'||.   /\+:::\
          /:::::( || \ / |:/:::)
          \:::+/-'L|, &  |::*:/
           |::(|_  _'   _\+::|
           |*::\ `-'   //,):/\
           |:::+| ||   
---------------------,
       ♣      ♦     /     ~ U T  S U P R A ~
  ♥        ♠      /   ~ S I C  I N F R A ~
                / 


HEADER
    echo -en "$NORMAL"
}

install() {
    set -e

    echo -e "\n${RED}Starting installation${NORMAL}\n"

    # Make basic home directory structure
    directories=(
        "$HOME/Git/github.com/cdata"
    )

    for directory in "${directories[@]}"; do
        make_directory $directory
    done

    # Clone the config repository
    clone $CONFIG_REPO $CONFIG_ROOT

    pushd $CONFIG_ROOT

    # Get the hardware configuration
    echo -e "Copying ${MAGENTA}/etc/nixos/hardware-configuration.nix${NORMAL} to ${MAGENTA}\$CONFIG_ROOT/hosts/${HOST}/${NORMAL}\n"
    cp /etc/nixos/hardware-configuration.nix $CONFIG_ROOT/hosts/${HOST}/hardware-configuration.nix

    # Build the system (flakes + home manager)
    echo -e "\nBootstrapping the ${YELLOW}'${HOST}' ${NORMAL}system...\n"
    sudo nixos-rebuild switch --flake .#${HOST}

    popd

    set +e
}

main() {
    set_variables
    print_header
    select_host
    install
}

main && exit 0
