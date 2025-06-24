#!/bin/sh

# Convert Gregorian date to Hijri Shamsi (Persian calendar)
# This script uses a simple approximation for Hijri Shamsi conversion

get_hijri_date() {
    # Get current date components
    local year=$(date +%Y)
    local month=$(date +%m)
    local day=$(date +%d)

    # Simple Hijri Shamsi conversion (approximate)
    # Hijri Shamsi starts from 622 CE and has different month lengths
    # This is a simplified conversion - for more accurate results, consider using a library

    # Calculate days since Hijri Shamsi epoch (March 21, 622 CE)
    local gregorian_days=$(( (year - 1) * 365 + (year - 1) / 4 - (year - 1) / 100 + (year - 1) / 400 ))
    local month_days=(0 31 28 31 30 31 30 31 31 30 31 30 31)

    # Adjust for leap years
    if [ $((year % 4)) -eq 0 ] && [ $((year % 100)) -ne 0 ] || [ $((year % 400)) -eq 0 ]; then
        month_days[2]=29
    fi

    for i in $(seq 1 $((month - 1))); do
        gregorian_days=$((gregorian_days + month_days[i]))
    done
    gregorian_days=$((gregorian_days + day))

    # Hijri Shamsi epoch adjustment (March 21, 622 CE)
    local hijri_days=$((gregorian_days - 226899))

    # Convert to Hijri Shamsi year (approximate)
    local hijri_year=$((hijri_days / 365))

    # Calculate remaining days for month/day
    local remaining_days=$((hijri_days % 365))

    # Hijri Shamsi months (approximate lengths)
    local hijri_months=(0 31 31 31 31 31 31 30 30 30 30 30 30)
    local hijri_month=1
    local hijri_day=$remaining_days

    for i in $(seq 1 12); do
        if [ $hijri_day -le ${hijri_months[i]} ]; then
            hijri_month=$i
            break
        fi
        hijri_day=$((hijri_day - hijri_months[i]))
    done

    # Format the date
    printf "%02d/%02d" $hijri_day $hijri_month
}

sketchybar --set "$NAME" label="$(get_hijri_date)"
