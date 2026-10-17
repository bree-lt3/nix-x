{ config, lib, ... }:

{
  options.home.gamemode.enable = lib.mkEnableOption "gamemode";
  config = lib.mkIf config.home.gamemode.enable {
    home-manager.users."breanna".programs.gamemode = {
      enable = true;
      settings.general.inhibit_screensaver = 0;
    };
  };
}
