#!/bin/sh

# Activate the Python virtual environment
VENV_PATH="$HOME/.config/sketchybar/venv"
. "$VENV_PATH/bin/activate"

# Get Persian date using Python and jdatetime
LABEL=$(python3 -c '
import jdatetime

# Persian month names in Finglish
months = [
    "Farvardin", "Ordibehesht", "Khordad", "Tir", "Mordad", "Shahrivar",
    "Mehr", "Aban", "Azar", "Dey", "Bahman", "Esfand"
]

# 3-letter English day names (starting from Saturday)
weekdays = ["Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"]

now = jdatetime.datetime.now()
# jdatetime weekday: 0=Saturday, 1=Sunday, ..., 6=Friday
weekday = now.weekday()

print(f"{weekdays[weekday]}, {now.day:02d} {months[now.month-1]}")
')

# Set the label in sketchybar
sketchybar --set "$NAME" label="$LABEL"

# Deactivate the virtual environment
deactivate
