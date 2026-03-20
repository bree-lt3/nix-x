{ ... }:

{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        nil_ls.enable = true;
        html.enable = true;
        ts_ls.enable = true;
      };
    };
  };
}
