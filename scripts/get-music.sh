#!/usr/bin/env bash
youtube-dl --audio-format "mp3" --extract-audio --audio-quality 256k --embed-thumbnail --add-metadata --output "~/downloads/music/%(title)s.%(ext)s" $1
