{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";

    };
    catppuccin.url = "github:catppuccin/nix";
    zen-browser.url = "github:MarceColl/zen-browser-flake";
  };

  outputs =
    {
      self,
      nixpkgs,
      catppuccin,
      zen-browser,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      name = "jmstevers";
      stateVersion = "24.11";
    in
    {
      nixosConfigurations.${name} = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs system name stateVersion;
        };
        modules = [
          catppuccin.nixosModules.catppuccin
          ./configuration.nix
        ];
      };
    };
}
