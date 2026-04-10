#!/bin/bash

# Ruta a tu carpeta de fondos (asegúrate de que la ruta sea correcta)
FOLDER="$HOME/.wallpapers"

while true; do
  # Elegir una imagen al azar de la carpeta
  WALLPAPER=$(find "$FOLDER" -type f \( -name '*.jpg' -o -name '*.png' \) | shuf -n 1)

  # Decirle a Hyprpaper que cargue la nueva imagen en la RAM
  hyprctl hyprpaper preload "$WALLPAPER"

  # Aplicar la imagen a todos los monitores
  hyprctl hyprpaper wallpaper ",$WALLPAPER"

  # Descargar las imágenes anteriores de la RAM para no saturar la memoria
  hyprctl hyprpaper unload unused

  # Esperar 10 minutos (600 segundos) antes de cambiar al siguiente
  # Puedes cambiar este número por los segundos que quieras
  sleep 600
done
