{ config, pkgs, lib, ... }:

{
  options.home.bash.enable = lib.mkEnableOption "bash";
  config = lib.mkIf config.home.bash.enable {
    #TODO: pass user down?
    home-manager.users."breanna".programs.bash = {
      enable = true;
      enableCompletion = true;

      sessionVariables = {
        BROWSER = "librewolf";
        EDITOR = "nvim";

        XDG_DOWNLOADS_DIR = "$HOME/downloads/";
      };

      shellAliases = {
        "bye" = "shutdown now";
      };

      bashrcExtra = "[[ $(tty) == /dev/tty1 ]] && exec sway";
    };
  };
}
