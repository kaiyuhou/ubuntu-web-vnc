#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "install docker"
apt-get install docker.io -y