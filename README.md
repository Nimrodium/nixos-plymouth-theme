# NixOS Boot Theme

<img width="1227" height="768" alt="nixos-plymouth" src="https://github.com/user-attachments/assets/a7f4c3c7-fae3-4e6a-b533-bf600910f701" />

Animated plymouth theme with NixOS logo and elegant look.

### Flake Install

Include in your `flake.nix` inputs:

```nix
inputs.mac-style-plymouth = {
  url = "github:Nimrodium/nixos-plymouth-theme";
  inputs.nixpkgs.follows = "nixpkgs";
};
```

Apply the overlay (`mac-style-plymouth.overlays.default`) to nixpkgs, and enable plymouth as follows.

```nix
# in example
pkgs = import nixpkgs {
  overlays = [ inputs.mac-style-plymouth.overlays.default ];
};
```

Use Theme 🥳

```nix
boot = {
  plymouth = {
    enable = true;
    theme = "mac-style";
    themePackages = [ pkgs.mac-style-plymouth ];
  };
};
```
## Acknowledgments
* [Based on MacOs style](https://www.gnome-look.org/p/2112595)
