{ pkgs,... }: {
    imports = [
        ./catppuccin.nix
        ./git.nix
        ./home-manager.nix
        ./vscode.nix
        ./nushell
        ./starship.nix
        ./wezterm
    ];

    home.packages = with pkgs; [
        google-chrome
        vesktop

        vulkan-tools
        gamemode
        
        fira-code
        zsh-powerlevel10k
        zsh-autocomplete
        zsh-syntax-highlighting

        latte-dock
    ];
}