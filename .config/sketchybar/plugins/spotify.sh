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

  # Create full text
  FULL_TEXT="$TRACK - $ARTIST"
  MAX_LENGTH=40

  # Only scroll if text is longer than MAX_LENGTH
  if [[ ${#FULL_TEXT} -gt $MAX_LENGTH ]]; then
    # Get current timestamp
    TIMESTAMP=$(date +%s)

    # Calculate scroll position - moves one character every second
    SCROLL_POS=$((TIMESTAMP % (${#FULL_TEXT} - MAX_LENGTH + 5)))

    # Extract the visible portion
    VISIBLE_TEXT="${FULL_TEXT:$SCROLL_POS:$MAX_LENGTH}"

    # Debug output to system log
    logger "Spotify scrolling: pos=$SCROLL_POS, text=$VISIBLE_TEXT"
  else
    VISIBLE_TEXT="$FULL_TEXT"
  fi

  # Update the item with the current song info
  sketchybar --set $NAME drawing=on label="$VISIBLE_TEXT" icon.drawing=off
else
  # Hide the item when Spotify is paused
  sketchybar --set $NAME drawing=off
fi
