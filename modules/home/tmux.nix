{ config, lib, ... }:

{
  options.home.tmux.enable = lib.mkEnableOption "tmux";
  config = lib.mkIf config.home.tmux.enable {
    home-manager.users."breanna".programs.tmux = {
      enable = true;
      prefix = "C-Space";
      keyMode = "vi";
      extraConfig = ''
        set -g status-style bg=default

        bind h          select-pane -L
        bind j          select-pane -D
        bind k          select-pane -U
        bind l          select-pane -R
      '';     
    };
  };
}
