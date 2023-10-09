#!/usr/bin/env bash
source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"
. "$PLUGIN_DIR/spotify.sh"

# menu
sketchybar -m --add item apple.logo left \
  --set apple.logo icon=$ICON_SETTINGS \
  label.drawing=off \
  icon.font="Liga SFMono Nerd Font:Bold:18.0" \
  click_script="sketchybar -m --set \$NAME popup.drawing=toggle" \
  popup.height=32 \
  popup.background.color=$GRAY \
  popup.background.border_width=2 \
  popup.background.corner_radius=3 \
  popup.background.border_color=$GRAY \
  script="$PLUGIN_DIR/popup.sh"

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
  lazy=off \
  icon.padding_left=0 \
  icon.padding_right=0

# date and time
sketchybar -m --add item date right \
  --set date icon=󰸗 update_freq=20 \
  background.color=$SALMON \
  script="$PLUGIN_DIR/date.sh"

# spotify
sketchybar --add item song right \
  --set song script="$PLUGIN_DIR/spotify.sh" update_freq=5 \
  background.color=$SALMON \
  icon.padding_right=0

# brew
sketchybar --add event brew_update \
  --add item brew right \
  --set brew icon=󰏔 \
  update_freq=20 \
  background.color=$SALMON \
  script="$PLUGIN_DIR/brew.sh" \
  --subscribe brew brew_update
