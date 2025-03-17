{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    devShells.x86_64-linux.default = pkgs.mkShell {
      buildInputs = [pkgs.python3];
    };

    nixosConfigurations = {
      # Seu desktop
      carnage = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/carnage/configuration.nix
          ./hosts/carnage/hardware-configuration.nix
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
