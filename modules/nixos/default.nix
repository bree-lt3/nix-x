{ lib, ... }:

{

      nixpkgs.config.allowUnfreePredicate = pkg:
        builtins.elem (lib.getName pkg) [
          "nvidia-x11"
          "nvidia-settings"
          "steam"
          "steam-unwrapped"
          "discord"
          "discord-unwrapped"
          "unityhub"
          "corefonts"
        ];
  imports = [
    ./users.nix
    ./tlp.nix
    ./bluetooth.nix
    ./nvidia.nix
    ./xdg.nix
    ./idk.nix
    ./unity.nix
    ./steam.nix
    ./vr.nix
    ./etc.nix
  ];
}
