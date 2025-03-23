#!/bin/sh

sketchybar --add item spotify center \
  --set spotify update_freq=1 \
  script="$PLUGIN_DIR/spotify.sh" \
  icon.drawing=off \
  background.color=0x40000000 \
  background.corner_radius=25 \
  background.height=25 \
  padding_left=10 \
  padding_right=10 \
  label.padding_left=8 \
  label.padding_right=8 \
  background.padding_left=10 \
  background.padding_right=10 \
  scroll_texts=on \
  label.max_chars=40 \
  label.scroll_duration=280 \
  --subscribe spotify mouse.clicked spotify_change
