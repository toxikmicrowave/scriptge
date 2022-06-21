#!/usr/bin/env bash

# Raspberry Pi Temp Check

temp=$(vcgencmd measure_temp | egrep -o '[0-9]*\.[0-9]*')

echo "No cap my G $temp is a lot of flames 🔥"
