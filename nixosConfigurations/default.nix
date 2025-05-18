{ config, lib, pkgs, ... }:
{  
  imports =
    [
      ./configuration.nix
      ./hardwareConfiguration.nix
    ];
}
