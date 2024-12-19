{ inputs, pkgs, username, host, hostname, configRoot, ... }:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;

    extraSpecialArgs = {
      inherit inputs username host hostname configRoot;
    };
    users.${username} = {
      imports = [ (import ./packages) ]
        ++ [ (import ./packages.nix) ]
        ++ [ (import ./scripts) ]
        # ++ [ (import ./hyprland.nix) ]
        ++ [ (import ./environment.nix) ];

      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "24.11";

      home.file = {
        "Pictures/wallpaper" = {
          source = ./wallpaper;
          recursive = true;
        };
        ".themes/rose-pine/gnome-shell/gnome-shell.css" = {
          source = builtins.toPath "${pkgs.rose-pine-gtk}/share/themes/gnome-shell.css";
        };
      };
      programs.home-manager.enable = true;
    };
  };
}
