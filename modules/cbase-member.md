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

### WiFi
- By default, the module configures WiFi for the `c-base` SSID. You can override or disable this in your own config if needed.
- **Note:** If you do not want the module to manage WiFi, set `networking.wireless.enable = false;` in your config _after_ importing the module.

### Audio
- The module enables PulseAudio and adds the user to audio/video/plugdev groups.

### Firefox
- Firefox is enabled. You can set a custom homepage or add extensions in your own config.

### Matrix
- Installs the Element desktop client for Matrix chat.

### Utilities
- Installs `htop`, `neofetch`, and `git`.

## Customization
You can override any option in your own configuration.nix after importing the module. For example, to skip WiFi setup:
```nix
networking.wireless.enable = false;
```

## Contributing
- PRs and issues welcome! Please follow the c-base and NixOS community guidelines.

## License
MIT License. (c) c-base e.V. 2025
