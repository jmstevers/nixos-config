{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      name = "jmstevers";
      stateVersion = "25.05";
    in
    {
      nixosConfigurations.${name} = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit
            inputs
            outputs
            name
            stateVersion
            ;
        };

        modules = [
          inputs.catppuccin.nixosModules.catppuccin
          ./configuration.nix
        ];
      };
    };
}
