{ config, lib, ... }:

{
  options.home.xdg.enable = lib.mkEnableOption "xdg";
  config = lib.mkIf config.home.xdg.enable {
    home-manager.users."breanna".xdg = {
      userDirs = {
        enable = true;
        setSessionVariables = false;
        download = "$HOME/Downloads";
      };
    };
  };
}
