#!/usr/bin/env bash
source "$HOME/.config/sketchybar/colors.sh"
. "$PLUGIN_DIR/spotify.sh"

# yabai spaces
sketchybar -m --add item yabai_spaces left \
  --set yabai_spaces drawing=off \
  updates=on \
  script="$PLUGIN_DIR/yabai_spaces.sh" \
  --subscribe yabai_spaces space_change window_created window_destroyed \
  \
  --add item space_template left \
  --set space_template label.color=$ICON_COLOR label.font="$FONT:Bold:17" \
  drawing=off \
  lazy=off

# date and time
sketchybar -m --add item date right \
  --set date icon=󰸗 update_freq=20 \
  background.color=$PURPLE \
  script="bash $PLUGIN_DIR/date.sh"

# spotify
sketchybar --add item song right \
  --set song script="$PLUGIN_DIR/spotify.sh" update_freq=5 \
  background.color=$PURPLE \
  icon.padding_right=0

# brew
sketchybar --add event brew_update \
  --add item brew right \
  --set brew icon=󰏔 \
  update_freq=20 \
  background.color=$PURPLE \
  script="$PLUGIN_DIR/brew.sh" \
  --subscribe brew brew_update
