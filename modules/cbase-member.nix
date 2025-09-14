{ config, pkgs, ... }:
{
  options.cbaseMember.enable = pkgs.lib.mkEnableOption "Enable c-base member setup";

  config = pkgs.lib.mkIf config.cbaseMember.enable {
    # WiFi: Add c-base WLAN config (edit SSID and password as needed)
    networking.wireless.enable = true;
    networking.wireless.networks = {
      "c-base" = {
        psk = "changeme"; # Replace with real key or use wpa_supplicant for enterprise
      };
    };

    # Audio: PulseAudio/PipeWire and user groups
    sound.enable = true;
    hardware.pulseaudio.enable = true;
    users.users.${config.users.users.root.name}.extraGroups = [ "audio" "video" "plugdev" ];

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
