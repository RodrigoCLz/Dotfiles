#!/bin/sh

# systray battery icon
cbatticon -u 5 &

# Deteccion de pantalla secundaria 
xrandr --output HDMI-1-0 --mode 1920x1080 --rate 74.99 --above eDP-1

# wallpapers
feh --bg-scale ~/Images/Wallpaper/Ciber_punk2.jpeg

# transparencia de terminal
picom --backend glx --vsync -b
