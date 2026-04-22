{ inputs, ... }:

{
  home-manager.sharedModules = [
    inputs.nixvim.homeModules.nixvim
  ];

  imports = [ 
    ./bash.nix
    ./nvim
    ./git.nix
    ./sway
    ./foot
    ./bemenu.nix
    ./etc.nix
  ];

  home-manager.users."breanna".home.stateVersion = "25.11";
}
