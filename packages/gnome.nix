{ pkgs, name, ... }:
{
  services = {
    displayManager.autoLogin = {
      enable = true;
      user = name;
    };
    xserver = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      videoDrivers = [ "amdgpu" ];
    };
  };
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
}
