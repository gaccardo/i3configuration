#!/bin/bash
pactl set-sink-volume 0 +5%

VOLUME=`pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'`

notify-send -t 350 "Volume control" "Volume: $VOLUME %"
