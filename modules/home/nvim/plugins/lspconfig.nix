{ ... }:

{
  plugins = {
    lspconfig = {
      enable = true;
      servers = {
        nil_ls.enable = true;
      };
    };
  };
}
