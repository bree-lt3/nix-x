{ inputs, ... }:

inputs.nixpkgs.lib.nixosSystem {
  specialArgs = { inherit inputs; };
  system = "x86_64-linux";
  modules = [ 
    ./hardware.nix
    inputs.home-manager.nixosModules.default
    ../../modules/nixos
    ../../modules/home
    {
      nix.settings.experimental-features = [ "nix-command" "flakes"];
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      security.polkit.enable = true;
      
      time.timeZone = "America/Los_Angeles";
 
      # TODO: look at callunas more and research
      networking.hostName = "gehenna";

      # TODO: make module
      networking.dhcpcd.enable = true;
      networking.networkmanager.enable = true;

      services.pipewire = {
        enable = true;
        pulse.enable = true;
      };
      
      # TODO: maybe make module or place in hardware.nix?
      hardware.graphics = {
        enable = true;
        enable32Bit = true;
      };

      services.xserver.videoDrivers = ["nvidia"];
      
      # TODO: is needed?
      services.libinput.enable = true;

      # think i need this ?
      programs.sway = {
        enable = true;
        wrapperFeatures.gtk = true;
      };

      etc.enable = true;
      # not working ?
      xdg.enable = true;
      # TODO: CHECK THIS ITS UNALLOWED PKGS MAKE IT NICER PLZ
      idk.enable = true;

      home = {
        bash.enable = true;
        nvim.enable = true;
        git.enable = true;
        xdg.enable = true;
        sway = { 
          enable = true;
          input = {
            "13159:6500:Endgame_Gear_Endgame_Gear_OP1_8k_Gaming_Mouse" = {
              accel_profile = "flat";
              pointer_accel = "0";
              natural_scroll = "disabled";
              left_handed = "disabled";
            };
          };
          output = { 
            "DP-3" = { 
              mode = "1920x1080@239.760Hz"; 
            };
          };
        };
        foot.enable = true;
        tmux.enable = true;
        bemenu.enable = true;
        bitwarden.enable = true;
        steam.enable = true;
        discord.enable = true;
        etc.enable = true;
      };

      # >,..,<
      system.stateVersion = "26.05"; 
    }
  ];
}

