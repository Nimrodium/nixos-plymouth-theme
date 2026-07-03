# NixOS Boot Theme

<img width="1227" height="768" alt="nixos-plymouth" src="https://github.com/user-attachments/assets/a7f4c3c7-fae3-4e6a-b533-bf600910f701" />

Animated plymouth theme with NixOS logo and elegant look.

### Flake Install

Include in your `flake.nix` inputs:

```nix
inputs.nixos-splash-plymouth = {
  url = "github:Nimrodium/nixos-plymouth-theme";
  inputs.nixpkgs.follows = "nixpkgs";
};
```

Apply the overlay (`nixos-splash-plymouth.overlays.default`) to nixpkgs, and enable plymouth as follows.

```nix
# in example
pkgs = import nixpkgs {
  overlays = [ inputs.nixos-splash-plymouth.overlays.default ];
};
```

Use Theme 🥳

```nix
boot = {
  plymouth = {
    enable = true;
    theme = "nixos-splash";
    themePackages = [ pkgs.nixos-splash-plymouth ];
  };
};
```
## Acknowledgments
* [Based on MacOs style](https://www.gnome-look.org/p/2112595)
* [Forked from this repository](https://github.com/SergioRibera/s4rchiso-plymouth-theme)
