#!/usr/bin/env bash

# You can call this script like this:
# $ ./volumeControl.sh up
# $ ./volumeControl.sh down
# $ ./volumeControl.sh mute

# Script modified from these wonderful people:
# https://github.com/dastorm/volume-notification-dunst/blob/master/volume.sh
# https://gist.github.com/sebastiencs/5d7227f388d93374cebdf72e783fbd6a

function get_volume {
  amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

function is_mute {
  amixer get Master | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}

function send_notification {
  iconSound="~/.config/dunst/icons/volume.svg"
  iconMuted="~/.config/dunst/icons/muted.svg"
  if is_mute ; then
    dunstify -i $iconMuted -r 2593 -u normal "mute" -t 1000
  else
    # Send the notification
    dunstify "" -i $iconSound  -u normal -h int:value:"`pamixer --get-volume`" -t 1000
  fi
}

case $1 in
  up)
    # up the volume (+ 5%)
    pamixer --allow-boost -i 3
    send_notification
    ;;
  down)
    pamixer --allow-boost -d 3
    send_notification
    ;;
  mute)
    # toggle mute
    paximer -t
    send_notification
    ;;
esac
