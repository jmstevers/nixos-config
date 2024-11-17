{
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

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  users.users.${name} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  time.timeZone = "America/Chicago";

  system.stateVersion = stateVersion;

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader.systemd-boot.enable = true;
  };

  hardware.graphics.enable = true;

  environment.variables.XDG_CONFIG_HOME = "/home/${name}/.config";
}
