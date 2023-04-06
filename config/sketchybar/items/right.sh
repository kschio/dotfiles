#!/usr/bin/env bash
source "$HOME/.config/sketchybar/colors.sh"

# time
sketchybar -m --add item date right \
  --set date update_freq=20 \
  background.color=$MAGENTA \
  label.color=$WHITE \
  label.font="$FONT:Bold:11" \
  icon.padding_right=0 \
  label.padding_left=0 \
  background.height=18 \
  background.corner_radius=2 \
  script="bash $PLUGIN_DIR/date.sh"
