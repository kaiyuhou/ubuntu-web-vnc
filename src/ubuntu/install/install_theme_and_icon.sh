#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Papirus Icons"
apt-get install software-properties-common -y
add-apt-repository ppa:papirus/papirus -y
apt-get update
apt-get install papirus-icon-theme

