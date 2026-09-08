{ config, lib, pkgs, ... }:

{
  options.home.discord.enable = lib.mkEnableOption "discord";
  config = lib.mkIf config.home.discord.enable {
    home-manager.users."breanna".home.packages = with pkgs; [
      discord
    ];
  };
}
