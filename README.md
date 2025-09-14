# c-base Member NixOS Module Documentation

## Overview
This NixOS module provides a convenient, reusable setup for members of c-base. It bundles common tools, services, and configuration options that are useful for working, hacking, and collaborating at c-base.

## Features
- **WiFi configuration** for c-base networks (optional, can be disabled)
- **Audio setup** (PulseAudio/PipeWire, user groups)
- **Firefox browser** (with optional c-base homepage)
- **Git** (for code.c-base.org)
- **Matrix client** (Element)
- **Useful utilities** (htop, neofetch, etc.)
- **User group memberships** (audio, video, plugdev, etc.)

## Usage

1. Add the flake as an input in your `flake.nix`:
   ```nix
   inputs.cbase-member.url = "github:lesbiannix/cbase-member";
   ```
2. Import the module in your NixOS configuration:
   ```nix
   imports = [
     inputs.cbase-member.nixosModules.default
   ];
   ```
3. Enable the module in your configuration:
   ```nix
   cbaseMember.enable = true;
   ```

## Options
- `cbaseMember.enable` (bool): Enable the c-base member setup (default: false).

## Examples

### Minimal Example
```nix
{
  imports = [
    inputs.cbase-member.nixosModules.default
  ];
  cbaseMember.enable = true;
}
```

### Disabling WiFi Management
If you want to use your own WiFi config, add this _after_ importing the module:
```nix
networking.wireless.enable = false;
```

### Customizing Audio
To use PipeWire instead of PulseAudio:
```nix
sound.enable = false;
hardware.pulseaudio.enable = false;
services.pipewire = {
  enable = true;
  audio.enable = true;
};
```

### Customizing Firefox
Set a custom homepage:
```nix
programs.firefox = {
  enable = true;
  homepage = "https://wiki.c-base.org";
};
```

### Adding More Packages
Add more system packages alongside the defaults:
```nix
environment.systemPackages = with pkgs; [
  element-desktop
  htop
  neofetch
  git
  gimp
  audacity
];
```

### Using with Home Manager
You can use this module with Home Manager by importing it in your system config and using Home Manager as usual. No special steps are needed.

### Disabling Individual Features
You can override any option after importing the module. For example, to disable Element:
```nix
environment.systemPackages = with pkgs; [
  htop
  neofetch
  git
  # element-desktop is omitted
];
```

## Customization
You can override any option in your own configuration.nix after importing the module. For example, to skip WiFi setup:
```nix
networking.wireless.enable = false;
```

## Contributing
- PRs and issues welcome! Please follow the c-base and NixOS community guidelines.

## License
MIT License. (c) c-base e.V. 2025
