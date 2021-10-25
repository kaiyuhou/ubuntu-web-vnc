#!/usr/bin/env bash
set -e

echo "Install TigerVNC server from apt"
apt-get install tigervnc-standalone-server tigervnc-xorg-extension -y