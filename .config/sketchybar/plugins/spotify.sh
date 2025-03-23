#!/bin/bash

# Check if Spotify is running
if ! pgrep -x "Spotify" >/dev/null; then
  sketchybar --set $NAME drawing=off
  exit 0
fi

# Get current Spotify status
SPOTIFY_PLAYER_STATE=$(osascript -e 'tell application "Spotify" to player state as string')

if [[ "$SPOTIFY_PLAYER_STATE" == "playing" ]]; then
  ARTIST=$(osascript -e 'tell application "Spotify" to artist of current track as string')
  TRACK=$(osascript -e 'tell application "Spotify" to name of current track as string')

  # Create full text
  FULL_TEXT="$TRACK - $ARTIST"

  # Update the item with the current song info
  sketchybar --set $NAME drawing=on label="$FULL_TEXT" icon.drawing=off
else
  # Hide the item when Spotify is paused
  sketchybar --set $NAME drawing=off
fi
