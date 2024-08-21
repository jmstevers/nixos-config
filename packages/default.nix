{ pkgs, ... }:
{
  imports = [
    ./nushell
    ./vscode
    ./wezterm
    ./catppuccin.nix
    ./git.nix
    ./home-manager.nix
    ./starship.nix
    ./direnv.nix
  ];

  home.packages = with pkgs; [
    google-chrome
    vesktop

    fira
    fira-code
    nixfmt-rfc-style
    nil

    latte-dock
  ];
}
