#!/usr/bin/env bash

# time
sketchybar -m --add item date right \
  --set date update_freq=60 \
  background.color=0xFFBE95FF \
  label.color=0xff000000 \
  label.font="$FONT:Bold:12" \
  icon.padding_right=0 \
  label.padding_left=0 \
  background.height=15 \
  background.corner_radius=2 \
  script="bash $PLUGIN_DIR/date.sh"
