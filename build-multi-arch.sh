#!/bin/bash
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t kaiyhou/ubuntu-vnc:latest \
  -t kaiyhou/ubuntu-vnc:18.04 \
  -t kaiyhou/ubuntu-vnc:18.04-20210910 \
  -f Dockerfile.ubuntu.xfce.vnc .

## init for the fisrt time
#
# docker buildx create --use --name mybuilder
# docker run --privileged --rm tonistiigi/binfmt --install all
# docker buildx inspect --bootstrap

