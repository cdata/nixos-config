{ inputs, username, host, ... }: {
  imports =
    [ (import ./aseprite/aseprite.nix) ]            # pixel art editor
    ++ [ (import ./audacious/audacious.nix) ]       # music player
    ++ [ (import ./bat.nix) ]                       # better cat command
    ++ [ (import ./btop.nix) ]                      # resouces monitor 
    ++ [ (import ./cava.nix) ]                      # audio visualizer
    ++ [ (import ./fuzzel.nix) ]                    # launcher
    ++ [ (import ./gaming.nix) ]                    # packages related to gaming
    ++ [ (import ./git.nix) ]                       # version control
    ++ [ (import ./gtk.nix) ]                       # gtk theme
    ++ [ (import ./helix.nix) ]                     # text editor
    ++ [ (import ./hyprland) ]                      # window manager
    ++ [ (import ./kitty.nix) ]                     # terminal
    ++ [ (import ./swaync/swaync.nix) ]             # notification deamon
    ++ [ (import ./micro.nix) ]                     # nano replacement
    ++ [ (import ./nvim.nix) ]                      # neovim editor
    ++ [ (import ./packages.nix) ]                  # other packages
    ++ [ (import ./retroarch.nix) ]
    ++ [ (import ./scripts/scripts.nix) ]           # personal scripts
    ++ [ (import ./starship.nix) ]                  # shell prompt
    ++ [ (import ./swaylock.nix) ]                  # lock screen
    ++ [ (import ./vscodium.nix) ]                  # vscode forck
    ++ [ (import ./waybar) ]                        # status bar
    ++ [ (import ./zsh.nix) ]; # shell
}
