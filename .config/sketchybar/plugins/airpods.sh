#!/bin/bash

# Get list of connected Bluetooth devices and check if DotPods Pro is the current output
AIRPODS_STATUS=$(system_profiler SPBluetoothDataType 2>/dev/null | grep -A 4 "DotPods Pro" | grep "Address:" | sed 's/.*Address: //')
AUDIO_OUTPUT=$(SwitchAudioSource -c)

if [[ ! -z "$AIRPODS_STATUS" ]]; then
  if [[ "$AUDIO_OUTPUT" == "DotPods Pro" ]]; then
    # Connected and being used as output - show speaker icon
    sketchybar --set $NAME icon="" icon.color=0xff6dd5fa drawing=on
  else
    # Connected but not being used as output - show regular airpods icon
    sketchybar --set $NAME icon="" drawing=off
  fi
else
  sketchybar --set $NAME drawing=off icon=""
fi
