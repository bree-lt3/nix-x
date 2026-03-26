{ ... }:

{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        clangd.enable = true;
        html.enable = true;
        lua_ls.enable = true;
        nil_ls.enable = true;
        pyright.enable = true;
        rust_analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
        };
        ts_ls.enable = true;
        texlab.enable = true;
      };
    };
  };
}
