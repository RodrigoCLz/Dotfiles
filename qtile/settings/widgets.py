from libqtile import widget
from .theme import colors
import subprocess
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
        icon = "󰖩"  # Wi-Fi
    else:
        return "󰲛"

    # Obtener tráfico en MB
    try:
        with open(f"/sys/class/net/{interface}/statistics/rx_bytes", "r") as f:
            down = int(f.read().strip())
        with open(f"/sys/class/net/{interface}/statistics/tx_bytes", "r") as f:
            up = int(f.read().strip())
    except Exception as e:
        return f"{icon} Error: {str(e)}"

    # Convertir a GB
    def bytes_to_gb(bytes):
        return round(bytes / 1024 / 1024 / 1024, 2)

    return f"{icon} {bytes_to_gb(down)}GB ↓↑ {bytes_to_gb(up)}GB"

def workspaces(): 
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
            disable_drag=True
        ),
        separator(),
        widget.WindowName(**base(fg='color5'), fontsize=14, padding=5),
        separator(),
    ]


primary_widgets = [
    *workspaces(),

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
        update_interval=2,  # Actualiza cada 2 segundos
    ),

    powerline('urgent', 'color9'),

    widget.CurrentLayoutIcon(
        **base(bg='urgent'),
        scale=0.7),

    powerline('color2', 'urgent'),

    icon(bg="color2", fontsize=17, text='󰃰'), # Icon: nf-mdi-calendar_clock

    widget.Clock(
        **base(bg='color2'), 
        format='%d/%m/%Y - %H:%M'),

    powerline('color10', 'color2'),

    widget.Systray(
        background=colors['color10'], 
        padding=5),
]

secondary_widgets = [
    *workspaces(),

    separator(),

    powerline('color1', 'dark'),

    widget.CurrentLayoutIcon(**base(bg='color1'), scale=0.65),

    widget.CurrentLayout(**base(bg='color1'), padding=5),

    powerline('color2', 'color1'),

    widget.Clock(**base(bg='color2'), format='%d/%m/%Y - %H:%M '),

    powerline('dark', 'color2'),
]

widget_defaults = {
    'font': 'Mononoki Nerd Font Bold',
    'fontsize': 14,
    'padding': 1,
}
extension_defaults = widget_defaults.copy()
