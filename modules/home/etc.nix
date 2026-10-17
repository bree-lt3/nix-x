{ config, lib, pkgs, ... }:

{
  options.home.etc.enable = lib.mkEnableOption "etc";
  config = lib.mkIf config.home.etc.enable {
    home-manager.users."breanna" = {
      home.packages = with pkgs; [
        #systools
        grim
        slurp
        wl-clipboard
        curl
        pavucontrol

        librewolf
        obs-studio

        zathura
        krita
        blender
      ];
    };
  };
}
