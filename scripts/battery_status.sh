#!/bin/bash

# Path to battery information (change to BAT0 if needed)
BATTERY_PATH="/sys/class/power_supply/BAT1"

# Check if the battery path exists
if [ ! -d "$BATTERY_PATH" ]; then
    echo "Battery info not available"
    exit 1
fi

# Read the battery charge level
battery_level=$(cat "$BATTERY_PATH/capacity")

# Read the battery status (charging or discharging)
battery_status=$(cat "$BATTERY_PATH/status")

# Choose an icon based on the charge level
if [ "$battery_status" == "Charging" ]; then
    icon=""  # Charging icon
elif [ "$battery_level" -ge 80 ]; then
    icon=""  # Battery above 80%
elif [ "$battery_level" -ge 60 ]; then
    icon=""  # Battery above 60%
elif [ "$battery_level" -ge 40 ]; then
    icon=""  # Battery above 40%
elif [ "$battery_level" -ge 20 ]; then
    icon=""  # Battery above 20%
else
    icon=""  # Battery below 20%
fi

# Display the battery level with the chosen icon
echo "$icon $battery_level%"

