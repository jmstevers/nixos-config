{
  inputs,
  lib,
  config,
  pkgs,
  name,
  stateVersion,
  ...
}:
{
  imports = [ ./packages ];

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  home = {
    username = name;
    homeDirectory = "/home/${name}";
  };

  systemd.user.startServices = "sd-switch";

  home.stateVersion = stateVersion;
}
