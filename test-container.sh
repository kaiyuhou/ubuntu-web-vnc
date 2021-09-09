#!/bin/bash
docker run -it \
  --privileged \
  --rm \
  --shm-size=256m \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /etc/timezone:/etc/timezone:ro \
  -p 8001:5901 -p 8002:6901 \
  -e VNC_PW=VNC_PASSWORD \
  -e VNC_RESOLUTION=1600x900 \
  -v ~/vnc-data:/home/ubuntu \
  --name consol-vnc \
  --user 0 \
  kaiyhou/consol-vnc-base