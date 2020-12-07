#!/bin/bash
pactl set-sink-mute 0 toggle

notify-send -t 350 "Volume control" "Volume: mute/unmute"
