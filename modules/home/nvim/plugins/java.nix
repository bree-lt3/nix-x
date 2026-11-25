{ ... }:

{
  plugins = {
    jdtls = {
      enable = true;
    };

    lsp.servers.jdtls = {
      enable = true;
      rootMarkers = [
        ".git"
      ];
      settings.java.project.sourcePaths = [ "src" ];
    };
  };
}
