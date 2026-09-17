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
    ./xdg.nix
    ./etc.nix
  ];

  # TODO: look at this for gehenna vs utero
  home-manager.users."breanna".home.stateVersion = "25.11";
}
