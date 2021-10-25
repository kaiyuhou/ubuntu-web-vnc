#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "adduser ubuntu"
adduser --disabled-password --gecos "" --uid 1000 ubuntu
adduser ubuntu sudo
newgrp docker
usermod -aG docker ubuntu

apt-get install sudo -y
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers