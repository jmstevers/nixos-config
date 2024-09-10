{ pkgs, inputs, ... }:
{
  imports = [
    ./nushell
    ./vscode
    ./wezterm
    ./catppuccin.nix
    ./git.nix
    ./home-manager.nix
    ./starship.nix
  ];

  home.packages = with pkgs; [
    inputs.zen-browser.packages."x86_64-linux".generic
    vesktop
    prismlauncher

    fira
    fira-code
    nixfmt-rfc-style
    nil

    blender-hip
  ];
}
