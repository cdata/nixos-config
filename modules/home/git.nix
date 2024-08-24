{ pkgs, ... }: 
{
  programs.git = {
    enable = true;
    
    userName = "Chris Joel";
    userEmail = "0xcda7a@gmail.com";
    
    extraConfig = { 
      init.defaultBranch = "main";
      credential.helper = "store";
    };
  };

  # home.packages = [ pkgs.gh pkgs.git-lfs ];
}
