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

      # NVIDIA frame-pacing mitigations:
      XRT_COMPOSITOR_USE_PRESENT_WAIT = "1";
      U_PACING_COMP_TIME_FRACTION_PERCENT = "90";
      U_PACING_APP_USE_MIN_FRAME_PERIOD = "1";
      U_PACING_APP_IMMEDIATE_WAIT_FRAME_RETURN_BELOW_REFRESH = "1";
    };
    
    # xrizer
    environment.systemPackages = with pkgs; [
      xrizer
    ];
  };
}
