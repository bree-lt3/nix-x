{ config, lib, pkgs, ... }:

{
  options.etc.enable = lib.mkEnableOption "etc";
  config = lib.mkIf config.etc.enable {
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "steam"
      "nvidia-x11"
      "nvidia-settings"
    ];

    environment.systemPackages = with pkgs; [
      htop
      vim
      wget
      git
      zip
      unzip

      fastfetch
      fzf
    ];

    #TODO: maybe module
    fonts.packages = with pkgs; [
      ibm-plex
    ];
  };
}
