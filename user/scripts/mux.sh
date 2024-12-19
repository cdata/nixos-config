#!/usr/bin/env bash

VIDEO_INPUT=$1
AUDIO_INPUT=$2
AUDIO_OFFSET=$3
VIDEO_OFFSET=0

VIDEO_LENGTH="$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 $VIDEO_INPUT)"

VIDEO_FILE_NAME=$(basename "$VIDEO_INPUT" .mp4)
VIDEO_DIRECTORY=$(dirname "$VIDEO_INPUT")
VIDEO_OUTPUT="$VIDEO_DIRECTORY/$VIDEO_FILE_NAME+audio.mp4"

ffmpeg -ss $VIDEO_OFFSET -i $VIDEO_INPUT \
    -ss $AUDIO_OFFSET -i $AUDIO_INPUT \
    -t $VIDEO_LENGTH \
    -c copy -map 0:v:0 -map 1:a:0 $VIDEO_OUTPUT