{ inputs, ... }@flakeContext:
{ config, lib, pkgs, ... }: {
  config = {
    environment = {
      systemPackages = [
        pkgs.ags_1
        pkgs.kitty
        pkgs.brave
        pkgs.ffmpeg
        pkgs.mediamtx
        pkgs.vlc
        pkgs.qbittorrent
        pkgs.wget
        pkgs.git
        pkgs.hyprland
        pkgs.pywal
        pkgs.python313Packages.material-color-utilities
        pkgs.sassc
        pkgs.python313Packages.pywayland
        pkgs.ollama
      ];
    };
  };
}
