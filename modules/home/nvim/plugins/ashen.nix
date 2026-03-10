{ pkgs, ... }:

{

  extraPlugins = with pkgs; [
    (vimUtils.buildVimPlugin {
      name = "vim-256noir";
      src = fetchFromGitHub {
        owner = "andreasvc";
        repo = "vim-256noir";
        rev = "bfb04bd50b69d863469b2deb9fb361cf0d945ba7";
        hash = "sha256-yC9V58zieE8YvEuAnJhEOgONrudUJgQFqC59cKo97/g=";
      };
    })
  ];
}

