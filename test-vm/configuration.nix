{ config, pkgs, ... }:
{
  imports = [ ../modules/cbase-member.nix ];
  cbaseMember.enable = true;
  # Minimal user for VM
  users.users.test = {
    isNormalUser = true;
    password = "test";
    extraGroups = [ "wheel" ];
  };
  # Use a simple bootloader for VM
  boot.loader.grub.device = "/dev/vda";
  # Networking (no WiFi for VM)
  networking.useDHCP = true;
  networking.wireless.enable = false;
}
