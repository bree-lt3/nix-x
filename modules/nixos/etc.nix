{ config, lib, pkgs, ... }:

{
  options.etc.enable = lib.mkEnableOption "etc";
  config = lib.mkIf config.etc.enable {
  # TODO: seperate from home/nixos modules
    environment.systemPackages = with pkgs; [
      #TODO: move to home-manager
      #bemenu
      grim
      slurp
      wl-clipboard

      htop
      vim
      wget
      git

      fastfetch
      fzf
    ];

    #TODO: maybe module
    fonts.packages = with pkgs; [
      ibm-plex
    ];
  };
}
