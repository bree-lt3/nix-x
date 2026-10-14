{ config, lib, pkgs, ... }:

let
  unityVersion = "2022.3.22f1";
  editor = "/home/breanna/Unity/Hub/Editor/${unityVersion}/Editor/Unity";

  unityFhs = pkgs.writeShellScriptBin "unity-fhs" ''
    exec -a "${editor}" \
      "${pkgs.unityhub.fhsEnv}/bin/unityhub-fhs-env" \
      "${editor}" "$@"
  '';
in
{
  options.unity.enable = lib.mkEnableOption "unity";
  config = lib.mkIf config.unity.enable {
    environment.systemPackages = with pkgs; [
      unityhub
      vrc-get
      alcom
      unityFhs
    ];
  };
}
