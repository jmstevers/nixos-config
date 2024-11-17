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
    ./git.nix
    ./nushell.nix
    ./steam.nix
    ./tmux.nix
  ];

  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages.${system}.specific
    vesktop
    nixfmt-rfc-style
    nil
    vscode
  ];
}
