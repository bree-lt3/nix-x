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
    ./discord.nix
    ./steam.nix
    ./etc.nix
  ];

  # need to change this for gehenna
  home-manager.users."breanna".home.stateVersion = "25.11";
}
