{ config, lib, ... }:

{
  options.home.nvim.enable = lib.mkEnableOption "nvim";
  config = lib.mkIf config.home.nvim.enable {
   home-manager.users."breanna".programs.nixvim = {
      enable = true;
      defaultEditor = true;
      
      colorscheme = "ashen";
      
      imports = [
        ./options.nix
        ./keymaps.nix
        ./plugins
      ];
    };
  };
}
