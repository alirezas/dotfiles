#!/bin/sh

WIDTH=12
if [ "$SELECTED" = "true" ]; then
  WIDTH=24
fi
sketchybar --animate tanh 20 --set $NAME icon.width=$WIDTH
