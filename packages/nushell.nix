{ pkgs, name, ... }:
{
  environment.systemPackages = with pkgs; [
    nushell
  ];

  users.users.${name} = {
    shell = pkgs.nushell;
  };
}
