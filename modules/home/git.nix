{ config, lib, ... }:

{
  options.home.git.enable = lib.mkEnableOption "git";
  config = lib.mkIf config.home.git.enable {
    home-manager.users."breanna".programs.git = {
      enable = true;
      settings = {
        user = {
          name = "bree-lt3";
          email = "52141078+bree-lt3@users.noreply.github.com";
        };
        init = {
          defaultBranch = "main";
        };
      };
    };
  };
}
