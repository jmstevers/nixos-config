{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    userSettings = import ./settings.nix;
    extensions = with pkgs.vscode-extensions; [
      biomejs.biome
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      streetsidesoftware.code-spell-checker
      fill-labs.dependi
      usernamehw.errorlens
      tamasfe.even-better-toml
      github.copilot
      github.copilot-chat
      eamodio.gitlens
      wholroyd.jinja
      jnoortheen.nix-ide
      brettm12345.nixfmt-vscode
      christian-kohler.path-intellisense
      esbenp.prettier-vscode
      rust-lang.rust-analyzer
      bradlc.vscode-tailwindcss
      thenuprojectcontributors.vscode-nushell-lang
      ziglang.vscode-zig
    ];
  };
}
