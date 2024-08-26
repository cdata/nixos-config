{ pkgs, ... }:
{
  programs.git = {
    enable = true;

    userName = "Chris Joel";
    userEmail = "0xcda7a@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      credential.helper = "store";
      user.signingKey = "15A408576FD99F28";
      commit.gpgSign = true;
    };
  };

  # home.packages = [ pkgs.gh pkgs.git-lfs ];
}
