{ inputs, ... }@flakeContext:
{ config, lib, pkgs, ... }: {
  config = {
    programs = {
      steam = {
        enable = true;
      };
    };
  };
}
