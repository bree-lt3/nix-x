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
      networking.hostName = "utero";

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
      
      # TODO: is needed?
      services.libinput.enable = true;

      # TODO: module and set hash passwd 
      users.users.breanna = {
        isNormalUser = true;
        description = "Breanna";
        extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
        home = "/home/breanna";
      };

      programs.sway = {
        enable = true;
        wrapperFeatures.gtk = true;
      };

      etc.enable = true;
      tlp.enable = true;
      bluetooth.enable = true;

      home = {
        bash.enable = true;
        nvim.enable = true;
        git.enable = true;
        sway.enable = true;
        foot.enable = true;
        bemenu.enable = true;
        etc.enable = true;
      };

      # >,..,<
      system.stateVersion = "25.11"; 
    }
  ];
}

