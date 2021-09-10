#!/bin/bash

PWD="VNC_PASSWORD"
if [ "$1" ] ;then
  PWD="$1"
fi

docker run -d \
  --privileged \
  --restart=on-failure:10 \
  --shm-size=256m \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /etc/timezone:/etc/timezone:ro \
  -p 8001:5901 -p 8002:6901 \
  -e VNC_PW="$PWD" \
  -e VNC_RESOLUTION=1600x900 \
  -v ~/vnc-data:/headless/share \
  --name ubuntu-vnc \
  kaiyhou/ubuntu-vnc

## --user 0: use root account, optional
## 5091: VNC, 6091: browser VNC
## timezone: share the timezone from host
## --shm-size=256m: avoid chrome crush
##                  another option is -v /dev/shm:/dev/shm
##                  https://github.com/ConSol/docker-headless-vnc-container/issues/53l