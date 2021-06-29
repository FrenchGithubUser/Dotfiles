#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bars
polybar bar -c ~/.config/polybar/main_bar &
polybar right_bar -c ~/.config/polybar/right_bar
#polybar mybar -c ~/.config/polybar/test

