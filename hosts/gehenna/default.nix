{ inputs, ... }:

inputs.nixpkgs.lib.nixosSystem {
  specialArgs = { inherit inputs; };
  system = "x86_64-linux";
  modules = [ 
    ./hardware.nix
    inputs.home-manager.nixosModules.default
    ../../modules/nixos
    ../../modules/home
    ../../modules/gehenna
    {
      nix.settings.experimental-features = [ "nix-command" "flakes"];
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      security.polkit.enable = true;
      
      time.timeZone = "America/Los_Angeles";
 
      # TODO: look at callunas more and research
      networking.hostName = "gehenna";

      # TODO: make module
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
      xdg.enable = true;

      home = {
        bash.enable = true;
        nvim.enable = true;
        git.enable = true;
        sway = { 
          enable = true;
          output = { 
            "DP-3" = { 
              mode = "1920x1080@239.760Hz"; 
            };
          };
        };
        foot.enable = true;
        bemenu.enable = true;
        steam.enable = true;
        discord.enable = true;
        etc.enable = true;
      };

      # >,..,<
      system.stateVersion = "26.05"; 
    }
  ];
}

