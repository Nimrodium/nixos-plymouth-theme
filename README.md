Fork of [SergioRibera's mac-style Plymouth theme](https://github.com/SergioRibera/s4rchiso-plymouth-theme), with a flake and some minor customization.

### Flake Install

Include in your `flake.nix` inputs:

```nix
inputs.mac-style-plymouth = {
  url = "github:zacharyweiss/nixos-mac-style-plymouth";
  inputs.nixpkgs.follows = "nixpkgs";
};
```

Apply the overlay (`mac-style-plymouth.overlays.default`) to nixpkgs, and enable plymouth as follows.

```nix
boot = {
  plymouth = {
    enable = true;
    theme = "mac-style";
    themePackages = [ pkgs.mac-style-plymouth ];
  };
};
```
