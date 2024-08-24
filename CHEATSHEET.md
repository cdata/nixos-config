sudo nixos-rebuild switch --flake .#framework-16-7940

sudo nix flake update

sudo nix-store --repair --verify --check-contents --help