#!/bin/bash
sinks=$(pactl list | grep "Sink #" | awk '{print $2}' | sed 's/#//')

for sink in $sinks;
do
    pactl set-sink-volume $sink -5%
done

VOLUME=`pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'`
notify-send -t 350 "Volume control" "Volume: $VOLUME %"
