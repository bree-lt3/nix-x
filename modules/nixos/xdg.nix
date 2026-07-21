{ config, lib, pkgs, ... }:

{ 
  options.xdg.enable = lib.mkEnableOption "xdg";
  config = lib.mkIf config.tlp.enable {
    xdg = {
      portal = {
        enable = true;
        wlr.enable = true;
        wlr.settings = {
          screencast = {
            chooser_type = "dmenu";
            chooser_cmd = "${pkgs.bemenu}/bin/bemenu";
            max_fps = 30;
          };
        };

        extraPortals = with pkgs; [
          xdg-desktop-portal-wlr
          xdg-desktop-portal-gtk
        ];
      };
    };
  };
}

