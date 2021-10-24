#!/bin/bash
docker build \
  -t kaiyhou/ubuntu-web-vnc:dev \
  -f Dockerfile.ubuntu.xfce.vnc .
