{ config, lib, pkgs, ... }:

{
  options.steam.enable = lib.mkEnableOption "steam";
  config = lib.mkIf config.steam.enable {
    programs.steam = {
      enable = true;
      package = pkgs.steam.override {
        extraProfile = ''
          export PRESSURE_VESSEL_IMPORT_OPENXR_1_RUNTIMES=1
          export PRESSURE_VESSEL_FILESYSTEMS_RW="$XDG_RUNTIME_DIR/monado_comp_ipc"
          export PRESSURE_VESSEL_FILESYSTEMS_RO="${pkgs.xrizer}"
          unset TZ
        '';
      };
    };

    # needed for vr? 
    hardware.steam-hardware.enable = true;
  };
}
