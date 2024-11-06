#!/bin/bash

# Check if playerctl is installed
if ! command -v playerctl &> /dev/null; then
    echo "Playerctl not found"
    exit 1
fi

# Check if Spotify is running
if ! pgrep -x "spotify" > /dev/null; then
    echo "🎧 Spotify not running"
    exit 0
fi

# Get artist and title metadata
artist=$(playerctl --player=spotify metadata artist)
title=$(playerctl --player=spotify metadata title)

# Get the Spotify player status (Playing, Paused, or Stopped)
status=$(playerctl --player=spotify status 2>/dev/null)

# Display the song title and artist with status
if [ "$status" == "Playing" ]; then
    echo " ▶ $artist - $title"    
elif [ "$status" == "Paused" ]; then
    echo " ❚❚ $artist - $title"  
else
    echo "-----"   
fi

