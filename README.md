# NixOS Boot Theme
![image](https://github.com/SergioRibera/s4rchiso-plymouth-theme/assets/56278796/0c6fc706-9131-4a94-bac9-ce4c8a7cd7a1)

Animated plymouth theme with NixOs logo and elegant look.

## Install
Configurate plymouth
```nix
{ pkgs, ... }: let
    mac-style-src = pkgs.fetchFromGitHub {
      owner = "SergioRibera";
      repo = "s4rchiso-plymouth-theme";
      rev = "bc585b7f42af415fe40bece8192d9828039e6e20";
      sha256 = "sha256-yOvZ4F5ERPfnSlI/Scf9UwzvoRwGMqZlrHkBIB3Dm/w=";
    };
    mac-style-load = pkgs.callPackage mac-style-src {};
in {
  boot = {
    plymouth = {
      enable = true;
      theme = "mac-style";
      themePackages = [ mac-style-load ];
    };
  };
}
```

## Acknowledgments
* [Based on MacOs style](https://www.gnome-look.org/p/2112595)
