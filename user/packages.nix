{ pkgs, ... }:
{

  home.packages = with pkgs;
    [
      aseprite # Pixel art editor
      avahi # mdns daemon
      bat # Alternative to cat
      # https://nixpk.gs/pr-tracker.html?pr=380449
      # (blender.override
      #   {
      #     # TODO: Make this sensitive to the chosen host
      #     hipSupport = true;
      #   })
      # blender # 3D modeling software
      calibre
      catppuccin
      claude-code
      dig # DNS query tool
      easyeffects
      evince # gnome pdf viewer
      eza # ls replacement
      fd # find replacement
      file # Show file information 
      furnace # Chiptune tracker
      fzf # fuzzy finder
      ghostscript_headless
      gifsicle # gif utility
      gimp # Raster image editor
      gtrash # rm replacement, put deleted files in system trash
      google-chrome # Web browser
      htop # Fancy top
      imagemagick
      inkscape # Vector image editor
      jq # JSON swiss army knife
      kitty-themes # Themes for the terminal of record
      kooha # Screen recorder
      krita # Digital painting tool
      ldtk # Tile map editor
      # lldb # Debugger for llvm-adjacent tools
      # See: https://github.com/NixOS/nixpkgs/issues/380196
      (lldb.overrideAttrs
        {
          dontCheckForBrokenSymlinks = true;
        })
      lmstudio
      nil # Used by VSCode Nix extensions
      nitch # system fetch util
      nixpkgs-fmt # Formatter for .nix files
      nix-prefetch-github # Used by VSCode Nix extensions
      obs-studio # Livestreaming studio} 
      ollama
      openscad # Parametric 3D modeler
      pest-ide-tools # LSP for Pest grammar language
      prusa-slicer # Model slicer for 3D printing
      poppler_utils # PDF manipulation
      qpdf # Moar PDF manipulation
      radicle-node
      rose-pine-cursor # Cursor theme
      rust-analyzer # LSP for Rust toolchains
      ripgrep # grep replacement
      silver-searcher # ag
      valgrind # c memory analyzer
      yazi # terminal file manager
      yubikey-manager # Configure security keys
      yt-dlp-light # Commnad-line video downloader
      zenity # Scriptable GTK+ dialogs
      # wayfarer # Screen recorder
      winetricks # Wine support config
      wineWowPackages.wayland # More of same

      # Fonts
      ibm-plex
      cascadia-code

      # C / C++
      gcc
      gnumake

      # Python
      python3

      bleachbit # Cache cleaner
      cmatrix # Text scroll effect from The Matrix
      gparted # Partition manager
      ffmpeg # Audio/video swiss army knife
      imv # Image viewer
      killall # Kill processes
      libnotify # Scriptable notifications
      man-pages # Extra man pages
      mpv # Video player
      ncdu # Explore disk usage in a folder
      pamixer # pulseaudio command line mixer
      pavucontrol # pulseaudio volume controle (GUI)
      playerctl # controller for media players
      wl-clipboard # clipboard utils for wayland (wl-copy, wl-paste)
      cliphist # clipboard manager
      poweralertd
      unzip # Decompress zip files
      wget # Fetch things from the network
      xdg-utils
      xxd # Dump binary input as formatted hex
    ];
}
