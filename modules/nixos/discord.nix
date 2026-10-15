{ config, lib, pkgs, ... }:

{
  options.idk.enable = lib.mkEnableOption "idk";
  config = lib.mkIf config.idk.enable {
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "discord"
      "discord-unwrapped"
    ];

    environment.systemPackages = with pkgs; [
      discord-ptb
    ];
  };
}
