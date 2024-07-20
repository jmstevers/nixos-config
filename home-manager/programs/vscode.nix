{ pkgs, ... }: {
    programs.vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
            Catppuccin.catppuccin-vsc
            Catppuccin.catppuccin-vsc-icons
            streetsidesoftware.code-spell-checker
            usernamehw.errorlens
            GitHub.copilot
            GitHub.copilot-chat
            eamodio.gitlens
            christian-kohler.path-intellisense
            bbenoist.Nix
        ];
    };
}