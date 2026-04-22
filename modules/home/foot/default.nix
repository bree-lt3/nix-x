{ config, pkgs, lib, ... }:

{
  options.home.foot.enable = lib.mkEnableOption "foot";
  config = lib.mkIf config.home.foot.enable {
    home-manager.users."breanna".programs.foot = {
      enable = true;
      settings = {
        main = {
          font = "IBM Plex Mono:size=14";
          
          include = "~/nix-x/modules/home/foot/ashen.ini";
        };
      };
    };
  };
}
