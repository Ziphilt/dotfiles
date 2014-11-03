#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# this is currently more annoying than helpful
#xautolock &

# hide mouse cursor when idle
#unclutter -idle 2 &

# setup keyboard
# TODO determine correct "model"
# TODO figure out how to map 'i' key in programmer dvorak
setxkbmap -model thinkpad -layout us -variant dvp
xmodmap .xmodmap &

xrdb .Xresources

start-pulseaudio-x11

#xrandr --output DP2 --mode 1280x1024 --right-of eDP1

# adjust screen brightness
# TODO put this in a systemd service unit
# redshift &

# disable X screensaver
xset s off
xset -dpms
# disable beep
xset b off

xset +fp /usr/share/fonts/local

# TODO does this even do anything?
xrandr --dpi 144

# set Thinkpad T440s touchpad to only scroll, no pointer movement
touchpad_id=$(xinput | perl -ne 'print $1 if m/Synaptics TouchPad.*id=(\d+)/')
xinput set-prop $touchpad_id 'Synaptics Soft Button Areas' 3477, 5112, 0, 0, 2659, 3476, 0, 0
xinput set-prop $touchpad_id 'Device Accel Constant Deceleration' 9999999
xinput set-prop $touchpad_id 'Synaptics Tap Action' 0, 0, 0, 0, 0, 0, 0

exec i3
