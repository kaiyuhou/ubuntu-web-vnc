#!/bin/bash
datetag=$(date '+%Y%m%d')
docker buildx build \
  --push \
  --platform linux/amd64,linux/arm64 \
  -t kaiyhou/ubuntu-web-vnc:latest \
  -t kaiyhou/ubuntu-web-vnc:18.04 \
  -t kaiyhou/ubuntu-web-vnc:18.04-$datetag \
  -f Dockerfile.ubuntu.xfce.vnc .


## init for the fisrt time
#
# docker buildx create --use --name mybuilder
# docker run --privileged --rm tonistiigi/binfmt --install all
# docker buildx inspect --bootstrap

## If --platform has multiple values, buildx build will also create a multi-arch manifest,
#  which is not compatible with --load/--output=type=docker.
#  If you want to use buildx build and have the image available in the local registry,
#  either don't specify a platform, or only specify one at a time.
