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

        librewolf
        firefox

        #discord
        zathura
        krita
        blender
      ];
    };
  };
}
