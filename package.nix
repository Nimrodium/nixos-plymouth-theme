{ stdenvNoCC }:
stdenvNoCC.mkDerivation {
  pname = "nixos-splash";
  version = "0.1.0";
  src = ./src;

  installPhase = ''
    mkdir -p $out/share/plymouth/themes/nixos-splash
    cp -r nixos-splash $out/share/plymouth/themes/
    chmod +x $out/share/plymouth/themes/nixos-splash/nixos-splash.plymouth
    substituteInPlace $out/share/plymouth/themes/nixos-splash/nixos-splash.plymouth --replace '@IMAGES@' "$out/share/plymouth/themes/nixos-splash/images/"
  '';
}
