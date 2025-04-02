{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    musnix.url = "github:musnix/musnix";
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
    in
    {
      nixosConfigurations.${name} = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit
            inputs
            outputs
            name
            ;
        };

        modules = [
          inputs.catppuccin.nixosModules.catppuccin
          inputs.musnix.nixosModules.musnix
          ./configuration.nix
        ];
      };
    };
}
