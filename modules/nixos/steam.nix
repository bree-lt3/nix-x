{ config, lib, pkgs, ... }:

{
  options.steam.enable = lib.mkEnableOption "steam";
  config = lib.mkIf config.steam.enable {
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "steam"
      "steam-unwrapped"
    ];

    programs.steam = {
      enable = true;
      package = pkgs.steam.override {
        extraProfile = ''
          export PRESSURE_VESSEL_IMPORT_OPENXR_1_RUNTIMES=1
          unset TZ
        '';
      };
    };

    # needed for vr? 
    hardware.steam-hardware.enable = true;
  };
}
