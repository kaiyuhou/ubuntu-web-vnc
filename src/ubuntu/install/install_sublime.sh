#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "install sublime"
apt-get install gnupg -y
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
apt-get install apt-transport-https -y
echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list
apt-get update
apt-get install sublime-text -y