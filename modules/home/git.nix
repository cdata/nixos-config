{ pkgs, ... }: 
{
  programs.git = {
    enable = true;
    
    userName = "HUMAN_NAME";
    userEmail = "USER_EMAIL";
    
    extraConfig = { 
      init.defaultBranch = "main";
      credential.helper = "store";
    };
  };

  # home.packages = [ pkgs.gh pkgs.git-lfs ];
}
