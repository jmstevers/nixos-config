{ pkgs, ... }: {
    programs.zsh = {
        enable = true;
        initExtraBeforeCompInit = ''
            # p10k instant prompt
            P10K_INSTANT_PROMPT="$XDG_CACHE_HOME/p10k-instant-prompt-''${(%):-%n}.zsh"
            [[ ! -r "$P10K_INSTANT_PROMPT" ]] || source "$P10K_INSTANT_PROMPT"
        '';
        plugins = [
            {
                name = "powerlevel10k";
                src = pkgs.zsh-powerlevel10k;
                file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
            }
            { name = "autocomplete"; src = pkgs.zsh-autocomplete; }
            { name = "syntax-highlighting"; src = pkgs.zsh-syntax-highlighting; }
        ];
    };
}