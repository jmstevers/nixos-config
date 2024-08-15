{ pkgs, ... }:
{
  imports = [
    ./catppuccin.nix
    ./git.nix
    ./home-manager.nix
    ./vscode.nix
    ./nushell
    ./starship.nix
    ./wezterm
  ];

  home.packages = with pkgs; [
    google-chrome
    vesktop

    vulkan-tools
    gamemode

    fira-code
    nixfmt-rfc-style
    nil

    latte-dock
  ];
}
