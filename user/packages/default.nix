{ ... }:
{
  imports = [
    (import ./vscodium.nix)
  ] ++ [
    (import ./ghostty.nix)
  ] ++ [
    (import ./helix.nix)
  ] ++ [
    (import ./gpg.nix)
  ] ++ [
    (import ./git.nix)
  ] ++ [
    (import ./zsh.nix)
  ] ++ [
    (import ./starship.nix)
  ];
}
