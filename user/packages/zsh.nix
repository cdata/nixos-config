{ configRoot, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "fzf"
      ];
    };
    initContent = pkgs.lib.mkBefore ''
      DISABLE_MAGIC_FUNCTIONS=true
      export "MICRO_TRUECOLOR=1"
    '';
    shellAliases = {
      # Launch terminal editor in current working directory
      e = "nohup ghostty --working-directory=`pwd` --initial-command='zsh -c \"hx ./\"' > /dev/null 2>&1 & disown";

      # Utils
      c = "clear";
      cd = "z";
      tt = "gtrash put";
      cat = "bat";
      code = "codium";
      hexdump = "xxd";
      icat = "kitten icat";
      open = "xdg-open";

      l = "eza --icons  -a --group-directories-first -1";
      ll = "eza --icons  -a --group-directories-first -1 --no-user --long";
      tree = "eza --icons --tree --group-directories-first";

      # Nix
      config = "cd ${configRoot} && codium ./";
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
