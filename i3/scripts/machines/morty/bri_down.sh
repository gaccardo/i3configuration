#!/bin/bash

SCREEN="eDP-1"
CURRENT=$(xrandr --verbose | grep Brightness | grep -o '[0-9].*')
NEW=$(echo $CURRENT-0.1|bc)

if [ $(echo "$NEW <= 0.1" | bc) -eq 1 ];
then
    NEW="0.1"
fi

xrandr --output $SCREEN --brightness $NEW
