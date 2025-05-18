{ config, lib, pkgs, ... }:

{  
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  
  # Mount network shares
  networking.hosts = { 
    "192.168.1.21" = [ "nas" ]; 
  };
  fileSystems."/mnt/media" = {
    device = "nas:/mnt/user/media";
    fsType = "nfs"; 
    options = [ "x-systemd.automount" "noauto" ]; 
  };
  fileSystems."/mnt/plex" = {
    device = "nas:/mnt/user/plex";
    fsType = "nfs"; 
    options = [ "x-systemd.automount" "noauto" ]; 
  };
  
  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";
  console.useXkbConfig = true;
 
  # Configure keymap in X11
  services.xserver.xkb.layout = "fr";

  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;

  # Define a user account.
  users.users.elcarom = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # List services that you want to enable:
  services.mediamtx = {
    enable = true;
    allowVideoAccess = true;
    settings = {
      paths = {
        cam = {
          runOnInit = "${lib.getExe pkgs.ffmpeg} -y -hwaccel cuda -hwaccel_output_format cuda -f v4l2 -input_format mjpeg -video_size 1920x1080 -framerate 30 -i /dev/video0 -vf scale_cuda=1920:1080 -c:v h264_nvenc -b:v 5M -f rtsp rtsp://localhost:$RTSP_PORT/main -vf scale_cuda=640:360 -c:v h264_nvenc -b:v 8M -f rtsp rtsp://localhost:$RTSP_PORT/sub";
          runOnInitRestart = true;
        };
        all_others = {
          runOnInitRestart = true;
        };
      };
    };
  };   

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Disable the firewall altogether.
  networking.firewall.enable = false;

  # System stateversion
  system.stateVersion = "25.05"; # Did you read the comment?

}
