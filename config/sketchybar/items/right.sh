#!/usr/bin/env bash
source "$HOME/.config/sketchybar/colors.sh"

# spotify
. "$PLUGIN_DIR/spotify.sh"

# time
sketchybar -m --add item date right \
  --set date update_freq=20 \
  background.color=$YELLOW \
  label.color=$BLACK \
  label.font="$FONT:Bold:11" \
  icon.padding_right=0 \
  label.padding_left=0 \
  background.height=18 \
  background.corner_radius=2 \
  script="bash $PLUGIN_DIR/date.sh"

sketchybar --add item song right \
  --set song script="$PLUGIN_DIR/spotify.sh" update_freq=5 background.color=$YELLOW \
  label.color=$BLACK \
  label.font="$FONT:Bold:11" \
  icon.padding_right=0 \
  label.padding_left=0 \
  background.height=18 \
  background.padding_right=10 \
  background.corner_radius=2
