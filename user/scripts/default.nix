{ pkgs, ... }:
let
  mux = pkgs.writeShellScriptBin "mux" (builtins.readFile ./mux.sh);
  record = pkgs.writeShellScriptBin "record" (builtins.readFile ./record.sh);
  ensure-environment = pkgs.writeShellScriptBin "ensure-environment" (builtins.readFile ./ensure-environment.sh);
  rebuild-nix = pkgs.writeShellScriptBin "rebuild-nix" (builtins.readFile ./rebuild-nix.sh);
  upgrade-nix = pkgs.writeShellScriptBin "upgrade-nix" (builtins.readFile ./upgrade-nix.sh);
in
{
  home.packages = [
    mux
    record
    ensure-environment
    rebuild-nix
    upgrade-nix
  ] ++ (with pkgs; [
    # Needed by record
    slurp
    wl-screenrec
  ]);
}
