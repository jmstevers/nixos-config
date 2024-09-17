{ name, ... }:
{
  networking = {
    networkmanager.enable = true;
    hostName = name;
    nameservers = [
      "208.67.222.222"
      "208.67.220.220"
    ];
  };
}
