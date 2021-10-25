#!/usr/bin/env bash
### every exit != 0 fails the script

#  http://manpages.ubuntu.com/manpages/bionic/man1/nss_wrapper.1.html
#  There are projects which provide daemons needing to be able to create, modify and delete
#       Unix users. Or just switch user ids to interact with the system e.g. a user space file
#       server. To be able to test that you need the privilege to modify the passwd and groups
#       file. With nss_wrapper it is possible to define your own passwd and groups file which will
#       be used by software to act correctly while under test.

set -e

echo "Install nss-wrapper to be able to execute image as non-root user"
apt-get update 
apt-get install -y libnss-wrapper gettext
apt-get clean -y

echo "add 'source generate_container_user' to .bashrc"

# have to be added to hold all env vars correctly
echo 'source $STARTUPDIR/generate_container_user' >> $HOME/.bashrc