{ config, pkgs, lib, ... }:

{
  options.home.tmux.enable = lib.mkEnableOption "tmux";
  config = lib.mkIf config.home.tmux.enable {
    home-manager.users."breanna".programs.tmux = {
      enable = true;
    };
  };
}
