{ pkgs, ... }:

{

  extraPlugins = with pkgs; [
    (vimUtils.buildVimPlugin {
      name = "fogbell.vim";
      src = fetchFromGitHub {
          owner = "jaredgorski";
          repo = "fogbell.vim";
          rev = "274cc13184f6a7d0589650c0763c94cef431b319";
          hash = "sha256-wBGzWeXvoMM2VTGP2G/X+259G5GN5HornTelbGyJ9B0=";
      };
    })
  ];
}

