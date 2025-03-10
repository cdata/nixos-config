{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    nix-gaming.url = "github:fufexan/nix-gaming";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hypr-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };
  };

  outputs = { nixpkgs, self, ... } @ inputs:

    let
      overlays = [ (import ./overlay).overlay ];
      pkgs = import nixpkgs {
        inherit system overlays;
        config.allowUnfree = true;
      };
      username = "cdata";
      configRoot = "/home/cdata/Git/github.com/cdata/nixos-config";
      system = "x86_64-linux";
    in
    {
      # overlays.default = selfPkgs.overlay;

      nixosConfigurations = {
        custom-desktop-contradiction = nixpkgs.lib.nixosSystem {
          inherit system pkgs;

          specialArgs = {
            host = "custom-desktop-contradiction";
            hostname = "contradiction";
            inherit self inputs username configRoot;
          };

          modules = [
            (import ./hosts/custom-desktop-contradiction)
            ./configuration.nix
          ];
        };

        framework-16-7940 = nixpkgs.lib.nixosSystem {
          inherit system pkgs;

          specialArgs = {
            host = "framework-16-7940";
            hostname = "distortion";
            inherit self inputs username configRoot;
          };

          modules = [
            (import ./hosts/framework-16-7940)
            ./configuration.nix
          ];
        };
      };
    };
}
