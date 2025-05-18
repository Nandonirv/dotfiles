{ config, lib, pkgs, ... }:
{  
  imports =
    [
      ./nvidia.nix
      ./packages.nix
    ];
}
