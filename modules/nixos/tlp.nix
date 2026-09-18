{ config, lib, pkgs, ... }:

{
  options.tlp.enable = lib.mkEnableOption "tlp";
  config = lib.mkIf config.tlp.enable {
    services.tlp = {
      enable = true;
      settings = {
        # start charge at 85 and below
        START_CHARGE_THRESH_BAT0 = 85;
        # stop charge at 90 and above
        STOP_CHARGE_THRESH_BAT0 = 90;
      };
    };
  };
}
