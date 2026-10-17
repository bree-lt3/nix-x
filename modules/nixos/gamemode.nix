{ config, lib, ... }:

{
  options.gamemode.enable = lib.mkEnableOption "gamemode";
  config = lib.mkIf config.gamemode.enable {
    programs.gamemode = {
      enable = true;
      settings.general.inhibit_screensaver = 0;
    };
  };
}
