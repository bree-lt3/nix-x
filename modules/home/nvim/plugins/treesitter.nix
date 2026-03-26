{ pkgs, ... }:

{
  plugins = {
    # autotags for ts
    ts-autotag.enable = true;

    treesitter = {
      enable = true;
      highlight.enable = true;

      grammerPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammers; [
        bash
        c
        css
        cpp
        html
        java
        javascript
        json
        jsonc
        latex
        lua
        markdown
        markdown_inline
        nix
        python
        rust
        tsx
        typescript
        vim
        vimdoc
        yaml
      ];
    };
  };
}
