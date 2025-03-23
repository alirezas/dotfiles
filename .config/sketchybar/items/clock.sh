#!/bin/sh

sketchybar --add item clock right \
  --set clock update_freq=10 \
  script="$PLUGIN_DIR/clock.sh" \
  icon.drawing=off \
  background.color=0x40000000 \
  background.corner_radius=25 \
  background.height=25 \
  background.padding_left=10 \
  background.padding_right=10 \
  padding_left=2 \
  padding_right=2 \
  icon.padding_left=0 \
  icon.padding_right=0 \
  label.padding_left=8 \
  label.padding_right=8
