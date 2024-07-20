{ pkgs, ... }: {
    programs.vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
            Catppuccin.catppuccin-vsc
            Catppuccin.catppuccin-vsc-icons

            GitHub.copilot
            GitHub.copilot-chat
            eamodio.gitlens

            streetsidesoftware.code-spell-checker
            christian-kohler.path-intellisense
            usernamehw.errorlens
            Gruntfuggly.todo-tree

            bbenoist.Nix
        ];
    };
}