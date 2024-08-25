#!/usr/bin/env bash

wallpaper_path=$HOME/Pictures/wallpaper
wallpapers_folder=$HOME/Pictures/wallpaper
wallpaper_name="$(ls $wallpapers_folder | fuzzel --dmenu)"
if [[ -f $wallpapers_folder/$wallpaper_name ]]; then
    find ~/Pictures/wallpaper -maxdepth 2 -type f -delete
    cp $wallpapers_folder/$wallpaper_name $wallpaper_path/$wallpaper_name
    wall-change $wallpaper_path/$wallpaper_name
else
    exit 1
fi