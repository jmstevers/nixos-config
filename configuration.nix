{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  name,
  stateVersion,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./packages
  ];

  nixpkgs.config.allowUnfree = true;

  nix =
    let
      flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in
    {
      settings = {
        experimental-features = "nix-command flakes";
        flake-registry = "";
        nix-path = config.nix.nixPath;
        auto-optimise-store = true;
      };

      channel.enable = false;

      registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
      nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}  ") flakeInputs;
    };

  users.users.${name} = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "gamemode"
    ];
  };

  time.timeZone = "America/Chicago";

  system.stateVersion = stateVersion;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.graphics.enable = true;

  environment.variables.XDG_CONFIG_HOME = "/home/jmstevers/.config";
}
