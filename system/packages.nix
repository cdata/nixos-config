{ pkgs, ... }:

{
  programs.zsh.enable = true;

  # SEE: https://github.com/nix-community/nix-ld
  programs.nix-ld.enable = true;

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

