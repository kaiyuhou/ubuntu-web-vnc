#!/usr/bin/env bash

# tested on Ubuntu 20.04
sudo apt update

# install ubuntu-desktop
sudo apt install -y ubuntu-desktop

# install tools
sudo apt install -y wget net-tools locales bzip2 htop nano python-numpy

# install fonts and inputs
sudo locale-gen en_US.UTF-8
sudo apt install -y ttf-wqy-zenhei fonts-noto-cjk-extra ibus-pinyin

# install vnc
sudo apt install -y tigervnc-standalone-server tigervnc-xorg-extension
sudo snap install novnc

# install Caddy
bash <(wget -qO- https://raw.githubusercontent.com/kaiyuhou/server/main/script/f_install_caddy.sh)
## Caddyfile: domain { reverse_proxy localhost:6001}

# start vnc
echo "Create Password for VNC"
vncpasswd
vncserver :1 -depth 24 -geometry 1600x900 # -localhost no # if enable client connection
novnc --listen 6901 --vnc localhost:5901 &

# Enable Pinyin in Ubuntu
# Settings -> Region & Language -> Input Sources -> Chinese (Intelligent Pinyin) | Win + Space for switch










