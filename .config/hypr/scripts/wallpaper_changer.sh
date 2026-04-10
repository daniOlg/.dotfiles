#!/bin/bash

# Wait for hyprpaper to start completely
sleep 2

# Directory path in English
WALLPAPER_DIR="$HOME/.wallpapers"

while true; do
  # Select a random image
  RANDOM_BG=$(find "$WALLPAPER_DIR" -type f \( -name '*.jpg' -o -name '*.png' \) | shuf -n 1)

  # Preload and set
  hyprctl hyprpaper preload "$RANDOM_BG"
  hyprctl hyprpaper wallpaper ",$RANDOM_BG"
  hyprctl hyprpaper unload unused

  # Wait 10 minutes
  sleep 300
done
