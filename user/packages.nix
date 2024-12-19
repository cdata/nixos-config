{ pkgs, ... }:
{

  home.packages = with pkgs;
    [
      avahi # mdns daemon
      bat # Alternative to cat
      blender # 3D modeling software
      catppuccin

      dig # DNS query tool
      evince # gnome pdf viewer
      eza # ls replacement
      fd # find replacement
      file # Show file information 
      furnace # Chiptune tracker
      fzf # fuzzy finder
      gifsicle # gif utility
      gimp # Raster image editor
      gtrash # rm replacement, put deleted files in system trash
      google-chrome # Web browser
      hexdump
      htop # Fancier top
      inkscape # Vector image editor
      jq # JSON swiss army knife
      kitty-themes # Themes for the terminal of record
      krita # Digital painting tool
      ldtk # Tile map editor
      lldb
      nil # Used by VSCode Nix extensions
      nitch # system fetch util
      nixpkgs-fmt # Formatter for .nix files
      nix-prefetch-github # Used by VSCode Nix extensions
      obs-studio # Livestreaming studio
      openscad # Parametric 3D modeler
      prusa-slicer # Model slicer for 3D printing
      rose-pine-cursor
      rust-analyzer # LSP for Rust toolchains
      ripgrep # grep replacement
      silver-searcher # ag
      valgrind # c memory analyzer
      yazi # terminal file manager
      yubikey-manager # Configure security keys
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
      unzip
      wget
      xdg-utils
      xxd
    ];
}
