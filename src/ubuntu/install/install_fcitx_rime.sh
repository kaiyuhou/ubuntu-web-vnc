#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install fcitx-rime Chinese Input"
apt-get update
apt-get install -y fcitx-rime
apt-get clean -y