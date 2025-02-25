{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs, ...
  } @ inputs: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    packages.x86_64-linux.hello = pkgs.hello;

    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

    packages.x96_64-linux.vesktop = pkgs.vesktop;

    devShells.x86_64-linux.default = pkgs.mkShell {
      buildInputs = [];
    };

    nixosConfigurations = {
      # Seu desktop
      carnage = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        system = "x86_64-linux";
        modules = [
          ./nixos/carnage/configuration.nix
          ./nixos/carnage/hardware-configuration.nix
        ];
      };

      # Seu notebook
      # maxwell = nixpkgs.lib.nixossystem {
      #   specialargs = {inherit inputs;};
      #   system = "x86_64-linux";
      #   modules = [
      #     ./nixos/maxwell/configuration.nix
      #     ./nixos/maxwell/hardware-configuration.nix
      #   ];
      # };
    };
  };
}
