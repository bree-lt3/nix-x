{ config, pkgs, lib, ... }:

{
  options.home."bitwarden".enable = lib.mkEnableOption "bitwarden";
  config = lib.mkIf config.home."bitwarden".enable {
    home-manager.users."breanna".home.packages = with pkgs; [
      bitwarden-cli
    ];
  };
}
