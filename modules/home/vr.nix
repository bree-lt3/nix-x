{ config, lib, pkgs, ... }:
{
  options.home.vr.enable = lib.mkEnableOption "vr";

  config = lib.mkIf config.home.vr.enable {
    home-manager.useGlobalPkgs = true;

    home-manager.users."breanna" = { config, pkgs, osConfig, ... }:
      let steam = "${config.xdg.dataHome}/Steam"; in
      {
        xdg.configFile."openxr/1/active_runtime.json".source =
          "${osConfig.services.monado.package}/share/openxr/1/openxr_monado.json";

        xdg.configFile."openvr/openvrpaths.vrpath" = {
          force = true;
          text = builtins.toJSON {
            version = 1;
            jsonid = "vrpathreg";
            external_drivers = null;
            config = [ "${steam}/config" ];
            log = [ "${steam}/logs" ];
            runtime = [ "${pkgs.xrizer}/lib/xrizer" ];
          };
        };
      };
  };
}
