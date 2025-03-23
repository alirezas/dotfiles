#!/bin/sh

sketchybar --add item airpods right \
  --set airpods update_freq=5 \
  script="$PLUGIN_DIR/airpods.sh" \
  background.color=0x40000000 \
  background.corner_radius=25 \
  background.height=25 \
  background.padding_left=10 \
  background.padding_right=10 \
  padding_left=2 \
  padding_right=2 \
  icon.padding_left=8 \
  icon.padding_right=8 \
  label.drawing=off
