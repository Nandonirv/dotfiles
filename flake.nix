{
  description = "";
  inputs = {
    nixpkgs.url = "flake:nixpkgs/nixpkgs-unstable";
  };
  outputs = inputs:
    let
      flakeContext = {
        inherit inputs;
      };
    in
    {
      nixosConfigurations = {
        nixos = import ./nixosConfigurations/nixos.nix flakeContext;
      };
      nixosModules = {
        default = import ./nixosModules/default.nix flakeContext;
        hardware = import ./nixosModules/hardware.nix flakeContext;
        mediamtx = import ./nixosModules/mediamtx.nix flakeContext;
        nvidia = import ./nixosModules/nvidia.nix flakeContext;
        packages = import ./nixosModules/packages.nix flakeContext;
        steam = import ./nixosModules/steam.nix flakeContext;
      };
    };
}
