#!/bin/bash
sinks=$(pactl list | grep "Sink #" | awk '{print $2}' | sed 's/#//')
for sink in $sinks;
do
    pactl set-sink-mute $sink toggle
done

notify-send -t 350 "Volume control" "Volume: mute/unmute"
