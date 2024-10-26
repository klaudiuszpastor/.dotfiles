#!/bin/bash

weather=$(curl -s "wttr.in/Wroclaw?format=%C+%t+Wind:%w+Humidity:%h")

echo "$weather"

