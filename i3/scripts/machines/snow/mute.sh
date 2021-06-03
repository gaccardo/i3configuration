#!/bin/bash
pactl set-sink-mute 1 toggle
pactl set-sink-mute 2 toggle
pactl set-sink-mute 3 toggle
pactl set-sink-mute 4 toggle
pactl set-sink-mute 5 toggle
pactl set-sink-mute 6 toggle
pactl set-sink-mute 7 toggle

notify-send -t 350 "Volume control" "Volume: mute/unmute"
