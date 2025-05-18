{ inputs, ... }@flakeContext:
{ config, lib, pkgs, ... }: {
  imports = [
    inputs.self.nixosModules.mediamtx
    inputs.self.nixosModules.nvidia
    inputs.self.nixosModules.packages
    inputs.self.nixosModules.steam
  ];
}
