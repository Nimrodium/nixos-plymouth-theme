# NixOS Boot Theme
![image](https://github.com/Nimrodium/nixos-plymouth-theme/nixos-plymouth.png)

Animated plymouth theme with NixOs logo and elegant look.

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
