#!/bin/bash

if pactl get-sink-mute @DEFAULT_SINK@ | grep -q "yes"; then
    echo "🔇 Muted"
else
    volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | tr -d '%')
    
    if [ "$volume" -ge 70 ]; then
        icon="🔊"
    elif [ "$volume" -ge 30 ]; then
        icon="🔉"
    else
        icon="🔈"
    fi
    
    echo "$icon $volume%"
fi

