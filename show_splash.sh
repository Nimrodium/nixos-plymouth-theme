#!/bin/sh
if [ "$(whoami)" != "root" ]; then
	echo "run as root"
	exit 1
fi

plymouthd
plymouth --show-splash --config /home/kyle/repo/nixos-plymouth-theme/src/nixos-splash/nixos-splash.plymouth
sleep $1
plymouth --quit
