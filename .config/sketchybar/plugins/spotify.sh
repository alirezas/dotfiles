#!/bin/bash

# Check if Spotify is running
if ! pgrep -x "Spotify" > /dev/null; then
  sketchybar --set $NAME drawing=off
  exit 0
fi

# Get current Spotify status
SPOTIFY_PLAYER_STATE=$(osascript -e 'tell application "Spotify" to player state as string')

if [[ "$SPOTIFY_PLAYER_STATE" == "playing" ]]; then
  ARTIST=$(osascript -e 'tell application "Spotify" to artist of current track as string')
  TRACK=$(osascript -e 'tell application "Spotify" to name of current track as string')

  # Truncate long track names and artist names
  if [[ ${#TRACK} -gt 30 ]]; then
    TRACK="${TRACK:0:30}..."
  fi

  if [[ ${#ARTIST} -gt 20 ]]; then
    ARTIST="${ARTIST:0:20}..."
  fi

  sketchybar --set $NAME drawing=on label="$TRACK - $ARTIST" icon.drawing=off
else
  # Hide the item when Spotify is paused
  sketchybar --set $NAME drawing=off
fi
