{ inputs, pkgs, ... }:
{
  home.packages = (with pkgs; [
    avahi # mdns daemon
    bitwise # cli tool for bit / hex manipulation
    blender
    evince # gnome pdf viewer
    eza # ls replacement
    entr # perform action when file change
    evince
    fd # find replacement
    file # Show file information 
    fzf # fuzzy finder
    gtt # google translate TUI
    gifsicle # gif utility
    gimp
    gnome-font-viewer
    gtrash # rm replacement, put deleted files in system trash
    google-chrome
    hexdump
    htop
    jdk17 # java
    krita
    lazygit
    nemo-with-extensions # file manager
    nil
    nitch # systhem fetch util
    nixpkgs-fmt
    nix-prefetch-github
    openscad
    prusa-slicer
    ripgrep # grep replacement
    silver-searcher
    soundwireserver # pass audio to android phone
    tdf # cli pdf viewer
    todo # cli todo list
    toipe # typing test in the terminal
    valgrind # c memory analyzer
    yazi # terminal file manager
    yubikey-manager
    yt-dlp-light
    zenity
    winetricks
    wineWowPackages.wayland

    # Fonts
    ibm-plex
    cascadia-code

    # C / C++
    gcc
    gnumake

    # Python
    python3

    bleachbit # cache cleaner
    cmatrix
    gparted # partition manager
    ffmpeg
    imv # image viewer
    killall
    libnotify
    man-pages # extra man pages
    mpv # video player
    ncdu # disk space
    openssl
    pamixer # pulseaudio command line mixer
    pavucontrol # pulseaudio volume controle (GUI)
    playerctl # controller for media players
    wl-clipboard # clipboard utils for wayland (wl-copy, wl-paste)
    cliphist # clipboard manager
    poweralertd
    qalculate-gtk # calculator
    unzip
    wget
    xdg-utils
    xxd
    inputs.alejandra.defaultPackage.${system}
  ]);
}
