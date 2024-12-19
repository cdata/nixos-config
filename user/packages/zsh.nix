{ configRoot, ... }:
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
    initExtraFirst = ''
      DISABLE_MAGIC_FUNCTIONS=true
      export "MICRO_TRUECOLOR=1"
    '';
    shellAliases = {
      e = "kitty --detach -o window_padding_width=0 -o background_opacity=0.8 -d `pwd` zsh -c 'hx ./'";

      # Utils
      c = "clear";
      cd = "z";
      tt = "gtrash put";
      cat = "bat";
      code = "codium";
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
