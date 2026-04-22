{ config, lib, ... }:
let 

mod = "Mod4";
left = "h";
down = "j";
up = "k";
right = "l";

term = "foot";
menu = "bemenu-run - i";

in {
  options.home.sway.enable = lib.mkEnableOption "sway";
  config = lib.mkIf config.home.sway.enable {
    home-manager.users."breanna".wayland.windowManager.sway = {
      enable = true;
      
      checkConfig = false;
      config = {
        modifier = "${mod}";
        keybindings = {
          "${mod}+${left}" = "focus left";
          "${mod}+${down}" = "focus down";
          "${mod}+${up}" = "focus up";
          "${mod}+${right}" = "focus right";

          "${mod}+Shift+${left}" = "move left";
          "${mod}+Shift+${down}" = "move down";
          "${mod}+Shift+${up}" = "move up";
          "${mod}+Shift+${right}" = "move right";

          "${mod}+Return" = "exec ${term}";
          "${mod}+space" = "exec ${menu}";
          "${mod}+Shift+q" = "kill";
          "${mod}+f" = "fullscreen";
          "${mod}+t" = "floating toggle";
          "${mod}+Shift+t" = "focus mode_toggle";

          "${mod}+Shift+e" = "exit";
          "${mod}+Shift+r" = "reload";

          "${mod}+1" = "workspace number 1";
          "${mod}+2" = "workspace number 2";
          "${mod}+3" = "workspace number 3";
          "${mod}+4" = "workspace number 4";
          "${mod}+5" = "workspace number 5";
          "${mod}+6" = "workspace number 6";
          "${mod}+7" = "workspace number 7";
          "${mod}+8" = "workspace number 8";
          "${mod}+9" = "workspace number 9";

          "${mod}+Shift+1" = "move container to workspace number 1";
          "${mod}+Shift+2" = "move container to workspace number 2";
          "${mod}+Shift+3" = "move container to workspace number 3";
          "${mod}+Shift+4" = "move container to workspace number 4";
          "${mod}+Shift+5" = "move container to workspace number 5";
          "${mod}+Shift+6" = "move container to workspace number 6";
          "${mod}+Shift+7" = "move container to workspace number 7";
          "${mod}+Shift+8" = "move container to workspace number 8";
          "${mod}+Shift+9" = "move container to workspace number 9"; 

          "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
          "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
          "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          "XF86AudioMicMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          "XF86MonBrightnessUp" = "exec brightnessctl s 10%+";
          "XF86MonBrightnessDown" = "exec brightnessctl s 10%-";
        
          "Print" = "exec grim - | tee ~/media/screenshots/screenshot-$(date +%Y%m%d-%H%M%S).png | wl-copy";
          "XF86SelectiveScreenshot" = "exec slurp | grim -g - - | tee ~/media/screenshots/screenshot-$(date +%Y%m%d-%H%M%S).png | wl-copy";
        };
        input = {
          "type:touchpad" = {
            # disable touchpad while typing (disable bc annoying)
            dwt = "disabled";
            tap = "enabled";
            natural_scroll = "enabled";
            middle_emulation = "enabled";
          };
        };
        window =  {
          titlebar = false;
        };
        gaps.smartBorders = "on";
        colors = {
          focused = {
            background = "#B14242";
            border = "#B14242";
            childBorder = "#B14242";
            indicator = "#B14242";
            text = "#B14242";
          };
        };
        bars = [{
          position = "top";
          command = "swaybar";
          statusCommand = "while $HOME/nix-x/modules/home/sway/bar.sh; do sleep 1; done";
          fonts = {
            names = [ "IBM Plex Mono" ];
            size = 10.0;
          };
          colors = {
            focusedWorkspace = {
              border = "#4c7899";
              background = "#B14242";
              text = "#ffffff";
            };
          };
        }];
#        output = {
#          eDP-1 = {
#            bg = "$HOME/nix-x/modules/home/sway/x1.png stretch";
#          };
#        };
      };
    };
  };
}
