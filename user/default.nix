{ inputs, pkgs, config, username, host, hostname, configRoot, configRepo, ... }:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "home-manager.backup";

    extraSpecialArgs = {
      inherit inputs username host hostname configRoot;
    };
    users.${username} = {
      imports = [ (import ./packages) ]
        ++ [ (import ./packages.nix) ]
        ++ [ (import ./scripts) ]
        # ++ [ (import ./hyprland.nix) ]
        ++ [ (import ./environment.nix) ];

      home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "24.11";
        file = {
          "Pictures/wallpaper" = {
            source = ./wallpaper;
            recursive = true;
          };
          ".themes/rose-pine/gnome-shell/gnome-shell.css" = {
            source = builtins.toPath "${pkgs.rose-pine-gtk}/share/themes/gnome-shell.css";
          };
        };

        # activation = with pkgs; {
        #   "ensureNixOSConfigRepository" = config.lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        #     if [ ! -d "${configRoot}" ]; then
        #       mkdir -p ${configRoot}
        #       $DRY_RUN_CMD ${pkgs.git}/bin/git clone ${configRepo} ${configRoot}
        #     fi
        #   '';
        # };
      };

      programs.home-manager.enable = true;
    };
  };
}
