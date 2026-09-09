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

        # not maintained ?
        #librewolf
        firefox
        obs-studio

<<<<<<< HEAD
        steam
        gamemode
        discord
=======
>>>>>>> 87ccb202debf94d66ed2f0327cf8084721685e15
        zathura
        krita
        blender
      ];
    };
  };
}
