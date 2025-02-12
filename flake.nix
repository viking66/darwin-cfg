{
  description = "Darwin system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, flake-utils }:
  let
    configuration = { ... }: {
      nix.settings.experimental-features = "nix-command flakes";
      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.stateVersion = 6;
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    darwinConfigurations."havoc" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ./configuration.nix ];
    };
  } // flake-utils.lib.eachDefaultSystem (system: {
    apps.install = {
      type = "app";
      program = toString (nixpkgs.legacyPackages.${system}.writeShellScript "install" ''
        ${nix-darwin.packages.${system}.darwin-rebuild}/bin/darwin-rebuild switch --flake .#havoc
      '');
    };
  });
}
