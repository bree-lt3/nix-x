{ inputs, ... }:

{
  home-manager.sharedModules = [
    inputs.nixvim.homeModules.nixvim
  ];

  imports = [ 
    ./bash.nix
    ./nvim
    ./git.nix
    ./xdg.nix
    ./sway
    ./foot
    ./tmux.nix
    ./bemenu.nix
    ./bitwarden.nix
    ./discord.nix
    ./steam.nix
    ./etc.nix
  ];

  # TODO: look at this for gehenna vs utero
  home-manager.users."breanna".home.stateVersion = "25.11";
}
