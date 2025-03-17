{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vital
  ];
}
