{ pkgs, name, ... }:
{
  environment = {
    variables = {
      SHELL = "/run/current-system/sw/bin/nu";
    };

    systemPackages = [
      pkgs.nushell
    ];
  };

  users.users.${name} = {
    shell = pkgs.nushell;
  };
}
