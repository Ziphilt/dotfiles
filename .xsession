#!/bin/bash
xmodmap .xmodmap &
# this is currently more annoying than helpful
#xautolock &

# adjust screen brightness
redshift &

# disable X screensaver
xset s off
xset -dpms

# set Thinkpad T440s touchpad to only scroll, no pointer movement
touchpad_id=$(xinput | perl -ne 'print $1 if m/Synaptics TouchPad.*id=(\d+)/')
xinput set-prop $touchpad_id 'Synaptics Soft Button Areas' 3477, 5112, 0, 0, 2659, 3476, 0, 0
xinput set-prop $touchpad_id 'Device Accel Constant Deceleration' 9999999
xinput set-prop $touchpad_id 'Synaptics Tap Action' 0, 0, 0, 0, 0, 0, 0

exec i3
