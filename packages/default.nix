{
  pkgs,
  inputs,
  system,
  ...
}:
{
  imports = [
    ./audio.nix
    ./catppuccin.nix
    ./desktop.nix
    ./flatpak.nix
    ./fonts.nix
    ./foot.nix
    ./gamemode.nix
    ./git.nix
    ./networking.nix
    ./nushell.nix
    ./powermanagement.nix
    ./starship.nix
    ./steam.nix
  ];

  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages.${system}.specific
    vesktop
    nixfmt-rfc-style
    nil
    vscode
  ];
}
