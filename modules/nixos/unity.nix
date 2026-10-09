{ config, lib, pkgs, ... }:

{
  options.unity.enable = lib.mkEnableOption "unity";
  config = lib.mkIf config.unity.enable {
    environment.systemPackages = with pkgs; [
      unityhub
      vrc-get
      alcom
    ];
  };
}
