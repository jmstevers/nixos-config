{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  system,
  name,
  stateVersion,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
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
      };

      channel.enable = false;

      registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
      nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    };

  users.users.${name} = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "gamemode"
    ];
  };

  home-manager = {
    extraSpecialArgs = {
      inherit inputs outputs;
    };
    backupFileExtension = "backup";
    users.${name} = import ./home.nix {
      inherit
        inputs
        lib
        config
        pkgs
        name
        stateVersion
        ;
    };
  };

  time.timeZone = "America/Chicago";

  system.stateVersion = stateVersion;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;
  networking.hostName = name;
  networking.nameservers = [
    "208.67.222.222"
    "208.67.220.220"
  ];

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = name;
  services.desktopManager.plasma6.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.pipewire.extraConfig.pipewire."92-low-latency" = {
    context.properties = {
      default.clock.rate = 48000;
      default.clock.quantum = 32;
      default.clock.min-quantum = 32;
      default.clock.max-quantum = 32;
    };
  };

  services.flatpak.enable = true;

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

  hardware.graphics.enable = true;
}
