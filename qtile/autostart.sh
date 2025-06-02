#!/bin/sh

# wallpapers
feh --bg-scale ~/Imágenes/wallpapers/steampunck_1.jpg
# transparencia de terminal
picom --backend glx --vsync -b
# systray battery icon
cbatticon -u 5 &
# Deteccion de pantalla secundaria 
xrandr --output HDMI-1-0 --mode 1920x1080 --rate 74.99 --right-of eDP-1
