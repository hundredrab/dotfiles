#!/bin/bash

# GS_toggle_touchpad.sh
# - toggle the touchpad on and off

# Gabriel Staples
# Written: 2 Apr. 2018
# Updated: 12 Sept. 2019

# References:
# - https://askubuntu.com/a/874865/327339
# - https://askubuntu.com/questions/844151/enable-disable-touchpad/1109515#1109515 <-- my own ans!

# Search for id number of "TouchPad" OR "Touchpad" in `xinput` list; manually type `xinput` to see all your devices
read TouchPadDeviceId <<< $( xinput | sed -nre '/TouchPad|Touchpad/s/.*id=([0-9]*).*/\1/p' )

state=$( xinput list-props "$TouchPadDeviceId" | grep "Device Enabled" | grep -o "[01]$" )

echo "TouchPadDeviceId = $TouchPadDeviceId"
echo "state = $state"

if [ "$state" -eq '1' ];then
    xinput --disable "$TouchPadDeviceId"
    zenity --info --text "Touchpad DISABLED" --timeout=2
    # Next line required only if using imwheel to fix slow scroll speed in Chrome, for ex; see here:
    # https://askubuntu.com/a/991680/327339
    # imwheel -b "4 5"
else
    xinput --enable "$TouchPadDeviceId"
    zenity --info --text "Touchpad ENABLED" --timeout=2
    # Next line required only if using imwheel to fix slow scroll speed in Chrome, for ex; see here:
    # https://askubuntu.com/a/991680/327339
    # killall imwheel
fi

