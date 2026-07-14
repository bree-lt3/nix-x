{ config, lib, ... }:

{
  options.home.bemenu.enable = lib.mkEnableOption "bemenu";
  config = lib.mkIf config.home.bemenu.enable {
    home-manager.users."breanna".programs.bemenu = {
      enable = true;
      settings = {
        line-height = 24;
        tf = "#7c7c7c";
        hf = "#7c7c7c";
      };
    };
  };
}
