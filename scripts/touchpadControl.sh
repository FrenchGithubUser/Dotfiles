#!/bin/bash

TOUCHPAD_STR="Touchpad" # other computers need it spelled like this with a lower-case 'p' in Touchpad

read TouchpadId <<< $( xinput | sed -nre "/${TOUCHPAD_STR}/s/.*id=([0-9]*).*/\1/p" )


#checking the state of the touchpad
newstate=
if [ "$#" -eq "0" ];  then
	# No positional parameters, so determine the actual current state so we can toggle it
	state=$( xinput list-props "$TouchpadId" | grep "Device Enabled" | grep -o "[01]$" )
	if [ "$state" -eq '1' ];then
		# state is ON, so toggle it to OFF
		newstate="OFF"
	else
		# state is OFF, so toggle it to ON
		newstate="ON"
	fi
fi


#toggling the touchpad on or off
if [ "$newstate" = "OFF" ];then
    xinput --disable "$TouchpadId"
elif [ "$newstate" = "ON" ];then
    xinput --enable "$TouchpadId"
fi
