{ pkgs, ... }: {
    home.packages = with pkgs; [
        google-chrome
        vesktop

        fira-code
        zsh-powerlevel10k
        zsh-autocomplete
        zsh-syntax-highlighting

        latte-dock
    ];
}