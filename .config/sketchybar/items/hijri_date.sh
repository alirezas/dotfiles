#!/bin/sh

sketchybar --add item hijri_date right \
  --set hijri_date update_freq=3600 \
  script="$PLUGIN_DIR/hijri_date.sh" \
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
