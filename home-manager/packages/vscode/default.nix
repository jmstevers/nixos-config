{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    userSettings = ./settings.json;
    extensions = with pkgs; [
      dz4k.vscode-hyperscript-or
      biomejs.biome
      Catppuccin.catppuccin-vsc
      Catppuccin.catppuccin-vsc-icons
      streetsidesoftware.code-spell-checker
      fill-labs.dependi
      usernamehw.errorlens
      tamasfe.even-better-toml
      GitHub.copilot
      GitHub.copilot-chat
      eamodio.gitlens
      otovo-oss.htmx-tags
      wholroyd.jinja
      leanprover.lean4
      jnoortheen.nix-ide
      brettm12345.nixfmt-vscode
      christian-kohler.path-intellisense
      esbenp.prettier-vscode
      rust-lang.rust-analyzer
      bradlc.vscode-tailwindcss
      dejmedus.tailwind-sorter
      TheNuProjectContributors.vscode-nushell-lang
      ziglang.vscode-zig
    ];
  };
}
