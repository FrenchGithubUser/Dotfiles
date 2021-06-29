#!/usr/bin/env bash
youtube-dl --audio-format "mp3" --extract-audio --audio-quality 256k --embed-thumbnail --metadata-from-title "(?P<artist>.+?) - (?P<title>.+)" --output "~/Downloads/music/%(artist)s - %(title)s.%(ext)s" $1
