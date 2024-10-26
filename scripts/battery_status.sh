#!/bin/bash

# Odczyt poziomu naładowania baterii
battery_level=$(cat /sys/class/power_supply/BAT1/capacity)

# Odczyt statusu baterii (ładowanie, rozładowywanie)
battery_status=$(cat /sys/class/power_supply/BAT1/status)

# Sprawdzenie czy bateria się ładuje czy rozładowuje
if [ "$battery_status" == "Charging" ]; then
    echo " $battery_level%"
elif [ "$battery_status" == "Discharging" ]; then
    echo " $battery_level%"
else
    echo " $battery_level%"
fi

