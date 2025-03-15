#!/bin/bash

# This script triggers a Spotify update event every second
while true; do
  sketchybar --trigger spotify_change
  sleep 1
done
