{ pkgs, ... }:
{
  imports = [
    ./nushell
    ./vscode
    ./wezterm
    ./catppuccin.nix
    ./direnv.nix
    ./git.nix
    ./home-manager.nix
    ./starship.nix
  ];

  home.packages = with pkgs; [
    google-chrome
    vesktop

    fira
    fira-code
    nixfmt-rfc-style
    nil
  ];
}
