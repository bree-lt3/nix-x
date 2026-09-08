
{ config, lib, ... }:

{
  options.etc.enable = lib.mkEnableOption "etc";
  config = lib.mkIf config.etc.enable {
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
      "steam"
      "steam-unwrapped"
      "discord"
    ];
  };
}
