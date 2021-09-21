#!/usr/bin/env bash

# You can call this script like this:
# $ ./brightnessControl.sh up
# $ ./brightnessControl.sh down


function send_notification {
  icon="~/.config/dunst/icons/brightness.svg"
  # Make the bar with the special character ─ (it's not dash -)
  # https://en.wikipedia.org/wiki/Box-drawing_character
  bar=$(seq -s "─" 0 $((brightness / 5)) | sed 's/[0-9]//g')
  # Send the notification
  dunstify "" -i "$icon" -u normal -h int:value:"`light -G`" -t 1000
}

case $1 in
  up)
    # increase the backlight by 5%
    backlight_control +5
    send_notification
    ;;
  down)
    # decrease the backlight by 5%
    backlight_control -5
    send_notification
    ;;
esac
