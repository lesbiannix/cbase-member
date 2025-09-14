{
  description = "NixOS module for c-base members";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        checks = {
          formatting = pkgs.runCommand "check-formatting" { } ''
            ${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt --check ${self}/modules/cbase-member.nix || exit 1
            touch $out
          '';
        };
      }
    ) // {
      nixosModules.default = import ./modules/cbase-member.nix;
      nixosConfigurations.test-vm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ self.nixosModules.default ./test-vm/configuration.nix ];
      };
    };
}
