#!/bin/bash

vncserver -kill :1
vncserver :1 -depth 24 -geometry 1600x900 # -localhost no # if enable client connection
sleep 2
novnc --listen 6901 --vnc localhost:5901 &> no_vnc_startup.log;
