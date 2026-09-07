{ config, lib, pkgs, ... }:

{
  options.etc.enable = lib.mkEnableOption "etc";
  config = lib.mkIf config.etc.enable {
    # modules maybe
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
      "steam"
      "steam-unwrapped"
      "discord"
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
