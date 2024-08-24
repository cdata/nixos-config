{ inputs, ... }: 
{
  imports = [ (import ./hyprland.nix) ]
    ++ [ (import ./config.nix) ]
    ++ [ (import ./hyprlock.nix) ]
    ++ [ (import ./hyprpaper.nix) ]
    ++ [ (import ./variables.nix) ]
    ++ [ inputs.hyprland.homeManagerModules.default ];
}
