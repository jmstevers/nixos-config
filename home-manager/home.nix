{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./programs
    ./packages
  ];

  nixpkgs = {
    overlays = [];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "jmstevers";
    homeDirectory = "/home/jmstevers";
  };

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.05";
}
