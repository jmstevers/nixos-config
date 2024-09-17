{ name, ... }:
{
  services = {
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
      autoLogin = {
        enable = true;
        user = name;
      };
    };
    desktopManager.plasma6.enable = true;
  };

  xdg.portal.enable = true;
}
