{ ... }:

{
  imports =
    [ (import ./boot.nix) ]
    ++ [ (import ./nix.nix) ]
    ++ [ (import ./users.nix) ]
    ++ [ (import ./time.nix) ]
    ++ [ (import ./i18n.nix) ]
    ++ [ (import ./network.nix) ]
    ++ [ (import ./audio.nix) ]
    ++ [ (import ./printing.nix) ]
    ++ [ (import ./environment.nix) ]
    ++ [ (import ./desktop.gnome.nix) ]
    # ++ [ (import ./desktop.hyprland.nix) ]
    ++ [ (import ./yubikey.nix) ]
    ++ [ (import ./fonts.nix) ]
    ++ [ (import ./packages.nix) ]
    ++ [ (import ./virtualization.nix) ];
}
