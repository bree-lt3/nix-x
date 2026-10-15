{ ... }:

{
  imports = [
    ./users.nix
    ./tlp.nix
    ./bluetooth.nix
    ./nvidia.nix
    ./xdg.nix
    ./etc.nix
    # TODO: plz find a better way of host specific pkgs
    ./idk.nix
    ./unity.nix
    ./steam.nix
    ./vr.nix
  ];
}
