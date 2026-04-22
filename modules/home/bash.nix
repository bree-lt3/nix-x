{ config, lib, ... }:

{
  options.home.bash.enable = lib.mkEnableOption "bash";
  config = lib.mkIf config.home.bash.enable {
    #TODO: pass user down?
    home-manager.users."breanna".programs.bash = {
      enable = true;
      enableCompletion = true;

      sessionVariables = {
        # Preserve PS1 in nixshell
        NIX_SHELL_PRESERVE_PROMPT = 1;

        BROWSER = "librewolf";
        EDITOR = "nvim";

        # TODO: look into firefox/librewolf fixes for default downloads dir
        XDG_DOWNLOAD_DIR = "$HOME/downloads";
        DOWNLOADS = "$HOME/downloads";
      };

      initExtra = ''
        . $HOME/.nix-profile/share/git/contrib/completion/git-prompt.sh
        . $HOME/.scripts/changeface.sh

        export PS1='[\h] $(__git_ps1 "(%s) ")\W $(__changeface)> '
      '';

      shellAliases = {
        "bye" = "shutdown now";
      };

      bashrcExtra = "[[ $(tty) == /dev/tty1 ]] && exec sway";
    };
  };
}
