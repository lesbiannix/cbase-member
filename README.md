# c-base NixOS Member Module

Welcome to the c-base NixOS member module! This project provides a reusable NixOS module for c-base members, making it easy to set up a laptop or workstation with the essentials for life at c-base.

## Features
- WiFi configuration for c-base networks
- Audio setup (PulseAudio/PipeWire, user groups)
- Firefox browser (with optional c-base homepage)
- Git (for code.c-base.org)
- Matrix client (Element)
- Useful utilities (htop, neofetch, etc.)
- User group memberships (audio, video, plugdev, etc.)

## Usage

1. Add this flake as an input to your NixOS configuration:

```nix
inputs.cbase-member.url = "github:YOUR-USERNAME/cbase-member";
```

2. Import the module in your `configuration.nix`:

```nix
imports = [
  inputs.cbase-member.nixosModules.default
];
```

3. Enable the module and configure options as needed.

## Development

- Run `nix flake check` to verify the module and formatting.
- Contributions welcome! 🎉

---

(c) c-base e.V. 2025. MIT License.
