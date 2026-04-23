{ ... }:

{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        clangd.enable = true;
        cssls.enable = true;
        emmet_ls.enable = true;
        glsl_analyzer.enable = true;
        html.enable = true;
        lua_ls.enable = true;
        nil_ls.enable = true;
        pyright.enable = true;
        rust_analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
        };
        tailwindcss.enable = true;
        ts_ls.enable = true;
        texlab.enable = true;
      };
    };
  };
}
