{ config, lib, ... }:

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

        # firefox/librewolf fixes for default downloads dir
        XDG_DOWNLOAD_DIR = "$HOME/downloads";
        DOWNLOADS = "$HOME/downloads";
      };

      shellAliases = {
        "bye" = "shutdown now";
      };

      bashrcExtra = "[[ $(tty) == /dev/tty1 ]] && exec sway";
    };
  };
}
