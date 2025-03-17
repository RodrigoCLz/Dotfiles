# Antonio Sarosi
# https://youtube.com/c/antoniosarosi
# https://github.com/antoniosarosi/dotfiles

# Qtile keybindings

from libqtile.config import Key
from libqtile.lazy import lazy


mod = "mod4"

keys = [Key(key[0], key[1], *key[2:]) for key in [
    # ------------ Window Configs ------------
    # Zoom windows

    ([mod], "f", lazy.window.toggle_fullscreen()),
    
    # Switch between windows in current stack pane
    ([mod], "Down", lazy.layout.down()),
    ([mod], "Up", lazy.layout.up()),
    ([mod], "Left", lazy.layout.left()),
    ([mod], "Right", lazy.layout.right()),
    ([mod], "Tab", lazy.layout.next()),

    # Change window sizes (MonadTall)
    ([mod, "shift"], "Up", lazy.layout.grow()),
    ([mod, "shift"], "Down", lazy.layout.shrink()),
    # Toggle floating
    #([mod, "shift"], "f", lazy.window.toggle_floating()),

    # Move windows up or down in current stack
    ([mod, "control"], "Down", lazy.layout.shuffle_down()),
    ([mod, "control"], "Up", lazy.layout.shuffle_up()),
    ([mod, "control"], "Right", lazy.layout.shuffle_right()),
    ([mod, "control"], "Left", lazy.layout.shuffle_left()),

    # Toggle between different layouts as defined below
    #([mod], "Tab", lazy.next_layout()),
    ([mod, "control"], "Tab", lazy.next_layout()),

    # Kill window
    ([mod], "w", lazy.window.kill()),

    # Switch focus of monitors
    ([mod], "period", lazy.next_screen()),
    ([mod], "comma", lazy.prev_screen()),

    # Restart Qtile
    ([mod, "control"], "r", lazy.restart()),

    ([mod, "control"], "q", lazy.shutdown()),
  
    # ------------ App Configs ------------

    # Menu
    ([mod], "space", lazy.spawn("rofi -show drun")),

    # Window Nav
    #([mod, "shift"], "m", lazy.spawn("rofi -show")),

    # Browser
    ([mod], "g", lazy.spawn("brave")),

    # File Explorer
    ([mod], "e", lazy.spawn("thunar")),

    # Terminal
    ([mod], "Return", lazy.spawn("kitty")),

    # Redshift
    #([mod], "r", lazy.spawn("redshift -O 2400")),
    #([mod, "shift"], "r", lazy.spawn("redshift -x")),

    # Screenshot
    ([], "Print", lazy.spawn("flameshot gui")),
    
    # ------------ Hardware Configs ------------

    # Volume
    ([], "XF86AudioLowerVolume", lazy.spawn(
        "amixer -q set Master 5%-"
    )),
    ([], "XF86AudioRaiseVolume", lazy.spawn(
        "amixer -q set Master 5%+"
    )),
    ([], "XF86AudioMute", lazy.spawn(
        "amixer -q set Master toggle"
    )),

    # Brightness
    ([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    ([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
]]
