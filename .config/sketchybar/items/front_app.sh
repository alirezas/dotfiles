#!/bin/bash

##### Adding Left Items #####
# We add some regular items to the left side of the bar, where
# only the properties deviating from the current defaults need to be set

sketchybar --add item chevron left \
  --set chevron icon= label.drawing=off \
  --add item front_app left \
  --set front_app icon.drawing=off script="$PLUGIN_DIR/front_app.sh" \
  background.color=0x40000000 \
  background.corner_radius=25 \
  background.height=25 \
  background.padding_left=10 \
  background.padding_right=10 \
  padding_left=10 \
  padding_right=10 \
  icon.padding_left=0 \
  icon.padding_right=0 \
  label.padding_left=8 \
  label.padding_right=8 \
  --subscribe front_app front_app_switched
