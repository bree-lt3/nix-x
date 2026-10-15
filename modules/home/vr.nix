{ config, lib, pkgs, ... }:

{
  options.home.vr.enable = lib.mkEnableOption "vr";
  config = lib.mkIf config.home.vr.enable {
    # xrizer for steam games
    xdg.configFile."openvr/openvrpaths.vrpath".text =
      let steam = "${config.xdg.dataHome}/Steam";
      in builtins.toJSON {
        version = 1;
        jsonid = "vrpathreg";
        external_drivers = null;
        config = [ "${steam}/config" ];
        log = [ "${steam}/logs" ];
        runtime = [ "${pkgs.xrizer}/lib/xrizer" ];
      };
  };
}
