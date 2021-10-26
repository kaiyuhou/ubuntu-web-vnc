#!/bin/bash

PWD="VNC_PASSWORD"
if [ "$1" ] ;then
  PWD="$1"
fi

VNCPT="8001"
if [ "$2" ] ;then
  VNCPT="$2"
fi

WEBPT="8002"
if [ "$3" ] ;then
  WEBPT="$3"
fi

docker run -d \
  --privileged \
  --restart=on-failure:10 \
  --shm-size=512m \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /etc/timezone:/etc/timezone:ro \
  -p "$VNCPT":5901 -p "$WEBPT":6901 \
  -e VNC_PW="$PWD" \
  -e VNC_RESOLUTION=1600x900 \
  -e VNC_CLIENT=false \
  -v ~/vnc-data:/headless/share \
  --name ubuntu-web-vnc \
  kaiyhou/ubuntu-web-vnc

## --user 0: use root account, optional
## 5091: VNC, 6091: browser VNC
## timezone: share the timezone from host
## --shm-size=256m: avoid chrome crush
##                  another option is -v /dev/shm:/dev/shm
##                  https://github.com/ConSol/docker-headless-vnc-container/issues/53l