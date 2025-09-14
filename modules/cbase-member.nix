{ config, lib, pkgs, ... }:
{
  options.cbaseMember.enable = lib.mkEnableOption "Enable c-base member setup";

  config = lib.mkIf config.cbaseMember.enable {
    # WiFi: Add c-base WLAN config (edit SSID and password as needed)
    networking.wireless.enable = lib.mkDefault true;
    networking.wireless.networks = {
      "c-base" = {
        psk = "changeme"; # Replace with real key or use wpa_supplicant for enterprise
      };
    };

    # Audio: PulseAudio/PipeWire and user groups
    sound.enable = true;
    hardware.pulseaudio.enable = true;
    # Please add your user to the audio, video, and plugdev groups in your own config if needed.

    # Firefox with c-base homepage (user can override)
    programs.firefox.enable = true;
    # programs.firefox.homepage = "https://wiki.c-base.org";

    # Git
    programs.git.enable = true;

    # Matrix client (Element)
    environment.systemPackages = with pkgs; [
      element-desktop
      htop
      neofetch
      git
    ];
  };
}
