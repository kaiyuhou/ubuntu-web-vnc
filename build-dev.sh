#!/bin/bash
docker build \
  -t kaiyhou/ubuntu-vnc:dev \
  -f Dockerfile.ubuntu.xfce.vnc .
