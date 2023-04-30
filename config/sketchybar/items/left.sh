#!/usr/bin/env bash
sketchybar -m --add item yabai_spaces left \
  --set yabai_spaces drawing=off \
  updates=on \
  script="$PLUGIN_DIR/yabai_spaces.sh" \
  --subscribe yabai_spaces space_change window_created window_destroyed \
  \
  --add item space_template left \
  --set space_template label.font="$FONT:Bold:17" \
  drawing=off \
  lazy=off
