{
  description = "Mac-style NixOS Plymouth Theme";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    with flake-utils.lib;
      eachDefaultSystem (system: let
        pkgs = import nixpkgs {
          inherit system;
        };
      in rec {
        packages = {
          default = pkgs.callPackage ./package.nix {};
          mac-style-plymouth = pkgs.callPackage ./package.nix {};
        };

        devShells.default = pkgs.mkShell {
          name = "ply";
          packages = with pkgs; [
            plymouth
            (pkgs.writeShellScriptBin "show" ''
              # check if runing as root user
              if [ "$EUID" -ne 0 ]; then
              	echo -e "This script needs to run as root user, please use \"sudo show\" instead";
              	exit 1;
              fi

              # starting plymouth deamon to show splashscreen
              echo -n "starting plymounthd   ..........................................   ";
              plymouthd ;
              if [ $? -gt 0 ]; then
              	echo -e "\nan error occoured while starting plymounthd" ;
              	echo "quitting plymouthd..."
              	plymouth --quit ;
              	if [ $? -gt 0 ]; then
              		echo "an error occoured stopping plymouthd" ;
              		echo "plymouthd might be still running in background"
              		exit 1;
              	fi
              	exit 1;
              fi
              echo "[done]" ;

              echo -n "showing currently selected splash screen theme   ...............   ";
              plymouth show-splash ;
              sleep 5 ;
              echo "[done]" ;

              echo -n "quitting plymouthd   ...........................................   ";
              plymouth --quit ;
              if [ $? -gt 0 ]; then
              	echo -e "\nan error occoured stopping plymouthd, retring" ;
              	n=0 ;
              	while [ $? -gt 0 -a $n -le 20 ]; do
              		plymouth --quit ;
              		n=$(( n+1 )) ;
              	done
              fi
              echo "[done]" ;

              exit 0;
            '')
          ];
        };
      })
      // {
        overlays.default = final: prev: {
          mac-style-plymouth = final.callPackage ./package.nix {};
        };
      };
}
