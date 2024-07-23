#!/usr/bin/env bash

init() {
    # Variables
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

select_host() {
    hosts=(
        "[${YELLOW}F${NORMAL}]ramework 16 7940"
        "[${YELLOW}V${NORMAL}]irtual machine"
    )

    echo -e "Available host configurations include:\n"

    for host in "${hosts[@]}"; do
        echo -e "- $host"
    done

    echo
    echo -en "Choose a ${GREEN}host${NORMAL}: ${YELLOW}"
    read -n 1 -r
    echo

    if [[ $REPLY =~ ^[Ff]$ ]]; then
        HOST='framework-16-7940'
    elif [[ $REPLY =~ ^[Vv]$ ]]; then
        HOST='vm'
    else
        echo "${NORMAL}Invalid choice. Only 'F' or 'V' allowed."
        exit 1
    fi
    
    echo
    echo -en "${NORMAL}Ready to bootstrap with the ${YELLOW}'${HOST}'${NORMAL} ${GREEN}host${NORMAL} configuration? "
    confirm
}

prompt_for_human_name() {
    echo -en "What is your ${GREEN}name${NORMAL}: $YELLOW"
    read human_name
    echo -en "$NORMAL"
}

prompt_for_user_name() {
    echo -en "What is your ${GREEN}user name${NORMAL}: $YELLOW"
    read user_name
    echo -en "$NORMAL"
}

prompt_for_user_email() {
    echo -en "What is your ${GREEN}email${NORMAL}: $YELLOW"
    read user_email
    echo -en "$NORMAL"
}

replace_template_variables() {
    sed -i -e "s/USER_NAME/${user_name}/g" $CONFIG_ROOT/flake.nix
    sed -i -e "s/HUMAN_NAME/${human_name}/g" $CONFIG_ROOT/modules/home/git.nix
    sed -i -e "s/USER_EMAIL/${user_email}/g" $CONFIG_ROOT/modules/home/git.nix
    sed -i -e "s/USER_NAME/${user_name}/g" $CONFIG_ROOT/modules/home/audacious/config
}

make_directory() {
    destination=$1
    echo -e "Making ${MAGENTA}${destination}${NORMAL}"
    mkdir -p $destination
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
        "$HOME/Pictures/wallpaper"
    )

    for directory in "${directories[@]}"; do
        make_directory $directory
    done

    # Clone the config repository
    clone $CONFIG_REPO $CONFIG_ROOT

    pushd $CONFIG_ROOT

    # Get the hardware configuration
    echo -e "Copying ${MAGENTA}/etc/nixos/hardware-configuration.nix${NORMAL} to ${MAGENTA}./hosts/${HOST}/${NORMAL}\n"
    cp /etc/nixos/hardware-configuration.nix ./hosts/${HOST}/hardware-configuration.nix

    # Copy the wallpapers
    echo -e "Copying all ${MAGENTA}wallpapers${NORMAL}"
    cp ./wallpaper/default.png $HOME/Pictures/wallpaper

    # Replace template variables
    echo -e "Replacing all template ${MAGENTA}variables${NORMAL}"
    replace_template_variables

    # Build the system (flakes + home manager)
    echo -e "\nBuilding the ${YELLOW}'${HOST}' ${NORMAL}system...\n"
    sudo nixos-rebuild switch --flake .#${HOST}

    popd

    set +e
}

main() {
    init

    print_header

    prompt_for_human_name
    prompt_for_user_name
    prompt_for_user_email

    select_host

    install
}

main && exit 0
