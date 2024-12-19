{ pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };


  environment.systemPackages = with pkgs; [
    dconf-editor
    gnome-tweaks
    gnome-shell-extensions
  ] ++ (with pkgs.gnomeExtensions; [
    user-themes
    tiling-shell
    # NOTE: You must also add the extension UUID to the list of enabled
    # extensions below!
  ]);

  programs.dconf = {
    enable = true;

    # NOTE: These user-specific settings don't seem to take in real-time; you
    # need to logout/login to get them to take.
    profiles.user.databases = with pkgs; [{
      settings = {
        "org/gnome/mutter" = {
          experimental-features = [ "scale-monitor-framebuffer" ];
        };
        "org/gnome/desktop/interface" = {
          cursor-theme = "BreezeX-RosePine-Linux";
          icon-theme = "BreezeX-RosePine-Linux";
          gtk-theme = "rose-pine-moon";
        };
        "org/gnome/shell/extensions/user-theme" = {
          name = "rose-pine";
        };
        "org/gnome/shell/extensions/tilingshell" = {
          inner-gaps = lib.gvariant.mkUint32 4;
          outer-gaps = lib.gvariant.mkUint32 4;
          enable-autotiling = true;
          layouts-json = (builtins.readFile ./desktop.gnome/tiling-shell-layouts.json);
        };
        "org/gnome/shell" = {
          # enables user extensions
          disable-user-extensions = false;
          enabled-extensions = with pkgs.gnomeExtensions; [
            # Put UUIDs of extensions that you want to enable here.
            # If the extension you want to enable is packaged in nixpkgs,
            # you can easily get its UUID by accessing its extensionUuid
            # field (look at the following example).
            user-themes.extensionUuid
            tiling-shell.extensionUuid

            # Alternatively, you can manually pass UUID as a string.  
            # "blur-my-shell@aunetx"
            # ...
          ];
        };
      };
    }];
  };
}
