{ ... }:
{
  programs.git = {
    enable = true;

    userName = "Chris Joel";
    userEmail = "0xcda7a@gmail.com";

    signing = {
      signByDefault = true;
      key = "15A408576FD99F28";
    };

    extraConfig = {
      init.defaultBranch = "main";
      credential.helper = "store";
    };
  };

  # home.packages = [ pkgs.gh pkgs.git-lfs ];
}
