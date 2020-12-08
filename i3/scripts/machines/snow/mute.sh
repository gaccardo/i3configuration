#!/bin/bash
pactl set-sink-mute 0 toggle
pactl set-sink-mute 1 toggle
pactl set-sink-mute 2 toggle
pactl set-sink-mute 3 toggle

notify-send -t 350 "Volume control" "Volume: mute/unmute"
