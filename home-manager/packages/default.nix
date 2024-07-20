{ pkgs, ... }: {
    home.packages = with pkgs; [
        google-chrome
        vesktop
        godot_4
        obsidian

        fira-code
        zsh-powerlevel10k
        zsh-autocomplete
        zsh-syntax-highlighting
        vscode-extensions

        latte-dock
    ];
}