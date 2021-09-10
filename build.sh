#!/bin/bash
docker build \
  -t kaiyhou/ubuntu-vnc:latest \
  -t kaiyhou/ubuntu-vnc:18.04 \
  -t kaiyhou/ubuntu-vnc:18.04-20210910 \
  -f Dockerfile.ubuntu.xfce.vnc .
