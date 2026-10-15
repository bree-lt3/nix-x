{ config, lib, pkgs, ... }:

{
  options.vr.enable = lib.mkEnableOption "vr";
  config = lib.mkIf config.vr.enable {
    # openxr monado instead of SteamVR
    services.monado = {
      enable = true;
      defaultRuntime = true;
      highPriority = true;
    };

    # monado envs
    systemd.user.services.monado.environment = {
      # Use SteamVR LH
      STEAMVR_LH_ENABLE = "1";
      XRT_COMPOSITOR_COMPUTE = "1";
    };

    environment.systemPackages = [ pkgs.xrizer pkgs.wayvr ];  
  };
}
