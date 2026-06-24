{ config, ... }:

{
  plugins = {
    # autotags for ts
    ts-autotag.enable = true;

    treesitter = {
      enable = true;
      highlight.enable = true;

      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
        bash
        c
        css
        cpp
        html
        java
        javascript
        json
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
