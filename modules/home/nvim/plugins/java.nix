{ ... }:

{
  plugins = {
    jdtls = {
      enable = true;
      settings.java.project.sourcePaths = [ "src" ];
    };
  };
}
