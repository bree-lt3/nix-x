
{ config, lib, ... }:

{
  options.idk.enable = lib.mkEnableOption "idk";
  config = lib.mkIf config.idk.enable {
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
      "steam"
      "steam-unwrapped"
      "discord"
    ];
  };
}
