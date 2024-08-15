use std *

$env.config = {
    show_banner: false
}

# templix

$env.templates = '/home/jmstevers/.config/nixpkgs/home-manager/packages/templix'

path add /home/jmstevers/code/templix/result/bin/

# direnv

{ ||
    if (which direnv | is-empty) {
        return
    }

    direnv export json | from json | default {} | load-env
}