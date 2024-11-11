{ inputs, pkgs, ... }:
{
  home.packages = (with pkgs; [
    avahi # mdns daemon
    bitwise # cli tool for bit / hex manipulation
    blender # 3D modeling software
    evince # gnome pdf viewer
    eza # ls replacement
    entr # perform action when file change
    evince # Gnome's document viewer
    fd # find replacement
    file # Show file information 
    furnace # Chiptune tracker
    fzf # fuzzy finder
    # gtt # google translate TUI
    gifsicle # gif utility
    gimp
    gnome-calculator
    gnome-font-viewer
    gtrash # rm replacement, put deleted files in system trash
    google-chrome
    # helix
    hexdump
    htop
    # jdk17 # java
    krita
    #lapce # Programming text editor
    ldtk
    lldb
    mission-center
    nemo-with-extensions # file manager
    nil
    nitch # systhem fetch util
    nixpkgs-fmt
    nix-prefetch-github
    obs-studio
    openscad
    prusa-slicer
    rust-analyzer
    ripgrep # grep replacement
    silver-searcher # ag
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
