{ pkgs, ... }:

{
  programs.zsh.enable = true;

  # SEE: https://github.com/nix-community/nix-ld
  programs.nix-ld.enable = true;

  # SEE: https://github.com/nix-community/home-manager/issues/4314
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {
    systemPackages = with pkgs; [
      neovim
      wget
      git
      vulkan-tools
    ];
  };
}

