{ inputs, ... }@flakeContext:
let
  nixosModule = { config, lib, pkgs, ... }: {
    config = {
      boot = {
        kernelPackages = pkgs.linuxPackages_latest;
      };
      console = {
        useXkbConfig = true;
      };
      i18n = {
        defaultLocale = "en_GB.UTF-8";
        extraLocaleSettings = {
          LC_ADDRESS = "fr_FR.UTF-8";
          LC_IDENTIFICATION = "fr_FR.UTF-8";
          LC_MESUREMENT = "fr_FR.UTF-8";
          LC_MONETARY = "fr_FR.UTF-8";
          LC_NAME = "fr_FR.UTF-8";
          LC_NUMERIC = "fr_FR.UTF-8";
          LC_PAPER = "fr_FR.UTF-8";
          LC_TELEPHONE = "fr_FR.UTF-8";
          LC_TIME = "fr_FR.UTF-8";
        };
      };
      networking = {
        firewall = {
          enable = false;
        };
        hostName = "nixos";
        networkmanager = {
          enable = true;
        };
      };
      nixpkgs = {
        config = { allowUnfree = true; };
      };
      programs = {
        hyprland = {
          enable = true;
        };
      };
      services = {
        desktopManager = {
          cosmic = {
            enable = true;
          };
        };
        displayManager = {
          cosmic-greeter = {
            enable = true;
          };
        };
        pipewire = {
          enable = true;
          pulse = {
            enable = true;
          };
        };
        xserver = {
          xkb = {
            layout = "fr";
          };
        };
      };
      system = {
        stateVersion = "25.05";
      };
      time = {
        timeZone = "Europe/Paris";
      };
      users = {
        users = {
          elcarom = {
            description = "elcarom";
            extraGroups = [
              "networkmanager"
              "wheel"
            ];
            isNormalUser = true;
          };
        };
      };
    };
  };
in
inputs.nixpkgs.lib.nixosSystem {
  modules = [
    nixosModule
  ];
  system = "x86_64-linux";
}
