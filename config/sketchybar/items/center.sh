#!/usr/bin/env bash

# title of frontmost app
sketchybar --add item system_label center \
  --set system_label script="sketchybar --set \$NAME label=\"\$INFO\"" \
  --subscribe system_label front_app_switched
