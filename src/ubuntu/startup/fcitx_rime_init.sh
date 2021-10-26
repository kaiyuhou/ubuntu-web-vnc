#!/bin/bash

echo -e "init fcitx-rime config"

fcitx > $STARTUPDIR/no_vnc_startup.log 2>&1 &
sleep 1
killall fcitx

echo -e "add rime to fcitx profile"
sed -i 's/#IMName=/IMName=rime/g' $HOME/.config/fcitx/profile
sed -i 's/rime:False/rime:True/g' $HOME/.config/fcitx/profile
fcitx > $STARTUPDIR/no_vnc_startup.log 2>&1 &
sleep 3
killall fcitx

echo -e "set rime to simplification Chinese"
sed -i 's/simplification/simplification\n    reset: 1/g' $HOME/.config/fcitx/rime/luna_pinyin.schema.yaml
fcitx > $STARTUPDIR/no_vnc_startup.log 2>&1 &
