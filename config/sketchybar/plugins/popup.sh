#!/bin/bash
source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

sketchybar -m --add item apple.preferences popup.apple.logo \
  --set apple.preferences icon=󰒓 \
  icon.color=$BLACK \
  icon.padding_left=10 \
  icon.padding_right=2 \
  label="Settings" \
  label.color=$BLACK \
  label.padding_left=4 \
  label.padding_right=4 \
  click_script="open -a 'System Preferences'; sketchybar -m --set command.logo popup.drawing=off"

sketchybar -m --add item apple.activity popup.apple.logo \
  --set apple.activity icon=􀒓 \
  icon.color=$BLACK \
  icon.padding_left=10 \
  icon.padding_right=2 \
  label="Settings" \
  label.color=$BLACK \
  label.padding_left=4 \
  label.padding_right=4 \
  label="Activity" \
  click_script="open -a 'Activity Monitor'; sketchybar -m --set apple.logo popup.drawing=off"

sketchybar -m --add item apple.lock popup.apple.logo \
  --set apple.lock icon=􀒳 \
  icon.color=$BLACK \
  icon.padding_left=10 \
  icon.padding_right=2 \
  label="Settings" \
  label.color=$BLACK \
  label.padding_left=4 \
  label.padding_right=4 \
  label="Lock Screen" \
  click_script="pmset displaysleepnow; sketchybar -m --set apple.logo popup.drawing=off"
