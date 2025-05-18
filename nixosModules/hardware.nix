{ inputs, ... }@flakeContext:
{ config, lib, pkgs, ... }: {
  config = {
    boot = {
      initrd = {
        availableKernelModules = [
          "nvme"
          "xhci_pci"
          "ahci"
          "thunderbolt"
          "usbhid"
          "usb_storage"
          "sd_mod"
        ];
      };
      loader = {
        efi = {
          canTouchEfiVariables = true;
        };
        systemd-boot = {
          enable = true;
        };
      };
    };
    fileSystems = {
      "/" = {
        device = "/dev/disk/by-uuid/96fd7117-8569-4196-945c-3adfd09e360a";
        fsType = "btrfs";
        options = [
          "subvol=root"
        ];
      };
      "/boot" = {
        device = "/dev/disk/by-uuid/68C6-6417";
        fsType = "vfat";
        options = [
          "fmask=0022"
          "dmask=0022"
        ];
      };
      "/home" = {
        device = "/dev/disk/by-uuid/96fd7117-8569-4196-945c-3adfd09e360a";
        fsType = "btrfs";
        options = [
          "subvol=home"
        ];
      };
      "/nix" = {
        device = "/dev/disk/by-uuid/96fd7117-8569-4196-945c-3adfd09e360a";
        fsType = "btrfs";
        options = [
          "subvol=nix"
        ];
      };
    };
    nixpkgs = {
      hostPlatform = {
        _type = "override";
        content = {
          system = "x86_64-linux";
        };
        priority = 1000;
      };
    };
  };
}
