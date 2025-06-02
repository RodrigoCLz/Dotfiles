from libqtile import widget
from .theme import colors
import subprocess, re
# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)

def base(fg='text', bg='dark'): 
    return {
        'foreground': colors[fg],
        'background': colors[bg]
    }

def separator():
    return widget.Sep(**base(), linewidth=0, padding=0)


def icon(fg='text', bg='dark', fontsize=16, text="?"):
    return widget.TextBox(
        **base(fg, bg),
        fontsize=fontsize,
        text=text,
        padding=5,
    )


def powerline(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),
        text="", # Icon: nf-oct-triangle_left
        fontsize=37,
        padding=-3,
    )
def bytes_to_gb(bytes):
        return round(bytes / 1024 / 1024 / 1024, 2)

def get_network_status():
    def is_interface_up(interface):
        path = f"/sys/class/net/{interface}/operstate"
        return open(path).read().strip() == "up"

    # Verificar Ethernet y Wi-Fi
    if is_interface_up("eno1"):
        interface = "eno1"
        icon = "󰈀"  # Ethernet
    elif is_interface_up("wlo1"):
        interface = "wlo1"
        icon = "󰖩"  
    else:
        return "󰲛"

    try:
        with open(f"/sys/class/net/{interface}/statistics/rx_bytes", "r") as f:
            down = int(f.read().strip())
        with open(f"/sys/class/net/{interface}/statistics/tx_bytes", "r") as f:
            up = int(f.read().strip())
    except Exception as e:
        return f"{icon} Error: {str(e)}"

    
    return f"{icon} {bytes_to_gb(down)}GB ↓↑ {bytes_to_gb(up)}GB"

def get_brightness_status():
    with open('/sys/class/backlight/intel_backlight/brightness', 'r') as f:
        current_brightness = int(f.read().strip())
    with open('/sys/class/backlight/intel_backlight/max_brightness', 'r') as f:
        max_brightness = int(f.read().strip())
    percent = int((current_brightness/max_brightness)*100) 
    if percent >= 0 and percent <= 20:
        icon = '󰃞'
    elif percent <= 60:
        icon = '󰃟'
    elif percent <=100:
        icon = '󰃠'
        
    return f'{icon} {percent}%' 

def get_volume_status():
    try:
        default_audio_device = subprocess.check_output(
            "pactl get-default-sink",
            shell=True,
            text=True,
        ).strip()
        
        volume_info = subprocess.check_output(
            f"pactl get-sink-volume {default_audio_device}",
            shell=True,
            text=True
        )
        volume_percent = int(re.search(r'(\d+)%', volume_info).group(1))
        
        mute_status = subprocess.check_output(
            f"pactl get-sink-mute {default_audio_device}",
            shell=True,
            text=True,
        ).strip()
        is_muted = "yes" in mute_status or volume_percent == 0

        device_info = subprocess.check_output(
            f"pactl list sinks | grep -A10 '{default_audio_device}' | grep 'Description'",
            shell=True,
            text=True,
        ).lower()
        
        if "speaker" in device_info:
            device_icons = {
                "muted" : "",
                "volume_low" : "",
                "volume_full" : ""
            }
        else :
            device_icons = {
                "muted" : "󰟎",
                "volume_low" : "󰋋",
                "volume_full" : "󰋋"
            } 
            
        if is_muted:
            icon = device_icons["muted"]
        elif volume_percent <= 50:
            icon = device_icons["volume_low"]
        elif volume_percent <= 100:
            icon = device_icons["volume_full"] 
            
    except Exception as e:
        return "Error"
    return  f"{icon} {volume_percent}%" 

def workspaces(primary=True): 
    return [
        separator(),
        widget.GroupBox(
            **base(fg='light'),
            font='UbuntuMono Nerd Font',
            fontsize=19,
            margin_y=5,
            margin_x=0,
            padding_y=8,
            padding_x=5,
            borderwidth=1,
            active=colors['color3'],
            inactive=colors['color2'],
            rounded=False,
            highlight_method='block',
            urgent_alert_method='block',
            urgent_border=colors['urgent'],
            this_current_screen_border=colors['grey'],
            this_screen_border=colors['grey'],
            other_current_screen_border=colors['dark'],
            other_screen_border=colors['dark'],
            disable_drag=True,
            block_highlight_text_color = colors['urgent'],
            hide_unused = False,
        ),
        separator(),
        widget.WindowName(**base(fg='color5'), fontsize=14, padding=5),
        separator(),
    ]


primary_widgets = [
    *workspaces(primary=True),

    separator(),

    powerline('color3', 'dark'),

    #icon(bg="color4", text=' '), # Icon: nf-fa-download
    #
    #widget.CheckUpdates(
    #    background=colors['color4'],
    #    colour_have_updates=colors['grey'],
    #    colour_no_updates=colors['grey'],
    #    no_update_string='0',
    #    display_format='{updates}',
    #    update_interval=1800,
    #    custom_command='checkupdates',
    #    
    #),
    icon(bg="color3", fontsize=17, text=""),

    widget.CPU(
        **base(bg="color3"),
        format=" {load_percent}%",
    ),
    icon(bg="color3", fontsize=17, text=" "),
    
    widget.Memory(
        **base(bg="color3"),
        format="{MemUsed:.2f}/{MemTotal:.2f}MB",
        measure_mem="G",
        update_interval=1.0,
    ),

    powerline('color6', 'color3'),

    icon(bg=("color6"), fontsize=17, text=""),

    widget.ThermalSensor(
        **base(bg="color6"),
        threshold=70,
        fmt="{}",
    ),

    powerline('color9', 'color6'),

    widget.GenPollText(
        **base(bg='color9'),
        func=get_network_status,
        update_interval=1, 
    ),
    
    powerline('urgent', 'color9'),
    
    # control de brillo 
    widget.GenPollText(
        **base(bg='urgent'),
        func=get_brightness_status,
        update_interval=0.5,
    ),
    
    powerline('urgent', 'urgent'),
    
    # control de audio
    widget.GenPollText(
        **base(bg='urgent'),
        func=get_volume_status,
        update_interval=0.5,
    ),
    powerline('color2', 'urgent'),

    icon(bg="color2", fontsize=17, text='󰃰'), 

    widget.Clock(
        **base(bg='color2'), 
        format='%d/%m/%Y  %H:%M'),

    powerline('color10', 'color2'),

    widget.Systray(
        background=colors['color10'], 
        padding=5),
]

secondary_widgets = [
    *workspaces(primary=False),

    separator(),

    powerline('color9', 'dark'),

    widget.GenPollText(
        **base(bg='color9'),
        func=get_network_status,
        update_interval=1, 
    ),
    
    powerline('urgent', 'color9'),
    
    widget.GenPollText(
        **base(bg='urgent'),
        func=get_brightness_status,
        update_interval=0.5,
    ),
    
    powerline('urgent', 'urgent'),
    
    widget.GenPollText(
        **base(bg='urgent'),
        func=get_volume_status,
        update_interval=0.5,
    ),
    powerline('color2', 'urgent'),

    icon(bg="color2", fontsize=17, text='󰃰'),
     
    widget.Clock(
        **base(bg='color2'), 
        format='%d/%m/%Y  %H:%M'),

]

widget_defaults = {
    'font': 'Mononoki Nerd Font Bold',
    'fontsize': 14,
    'padding': 1,
}
extension_defaults = widget_defaults.copy()
