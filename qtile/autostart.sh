#!/bin/sh

# wallpapers
feh --bg-scale ~/Imágenes/wallpapers/steampunck_1.jpg
# transparencia de terminal
picom --backend glx --vsync -b
# systray battery icon
cbatticon -u 5 &
# systray volume
volumeicon &
