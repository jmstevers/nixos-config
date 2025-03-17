{
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = [
    inputs.zen-browser.packages.${pkgs.hostPlatform.system}.twilight
  ];
}
