{ inputs, ... }:
{
  imports = [ inputs.catppuccin.homeManagerModules.catppuccin ];

  catppuccin = {
    enable = true;
    accent = "mauve";
    flavor = "macchiato";
    pointerCursor = {
      enable = true;
      accent = "mauve";
      flavor = "macchiato";
    };
  };
}
