{ config, lib, pkgs, ... }:

{
  options.home.vr.enable = lib.mkEnableOption "vr";

  config = lib.mkIf config.home.vr.enable {
    home-manager.users."breanna" = { config, ... }:
      let
        hmConfig = config;
        steam = "${hmConfig.xdg.dataHome}/Steam";
      in
      {
        xdg.configFile."openvr/openvrpaths.vrpath".text =
          builtins.toJSON {
            version = 1;
            jsonid = "vrpathreg";
            external_drivers = null;
            config = [ "${steam}/config" ];
            log = [ "${steam}/logs" ];
            runtime = [ "${pkgs.xrizer}/lib/xrizer" ];
          };
      };
  };
}
