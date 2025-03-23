#!/bin/sh

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")
for i in "${!SPACE_ICONS[@]}"; do
  sid="$(($i+1))"
  sketchybar --add space space."$sid" left \
             --set space."$sid" associated_space="$sid" \
             icon="" \
             icon.width=12 \
             background.height=12 \
             background.drawing=on \
             background.color=0x40000000 \
             background.corner_radius=25 \
             background.padding_left=4 \
             background.padding_right=4 \
             label.drawing=off \
             script="$PLUGIN_DIR/space.sh"
done

sketchybar --set space.1 background.padding_left=-1
