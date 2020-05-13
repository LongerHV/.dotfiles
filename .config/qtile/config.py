# -*- coding: utf-8 -*-
# A customized config.py for Qtile window manager (http://www.qtile.org)
# Modified by LongerHV (http://www.gitlab.com/LongerHV)
# Based on Derek Taylor configuration (http://www.gitlab.com/dwt1)
#
# The following comments are the copyright and licensing information from the default
# qtile config. Copyright (c) 2010 Aldo Cortesi, 2010, 2014 dequis, 2012 Randall Ma,
# 2012-2014 Tycho Andersen, 2012 Craig Barnes, 2013 horsik, 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of this
# software and associated documentation files (the "Software"), to deal in the Software
# without restriction, including without limitation the rights to use, copy, modify,
# merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to the following
# conditions:
#
# The above copyright notice and this permission notice shall be included in all copies
# or substantial portions of the Software.

##### IMPORTS #####
import os
import re
import socket
import subprocess
from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook, extension
from typing import List  # noqa: F401

##### DEFINING SOME VARIABLES #####
mod = "mod4"                                     # Sets mod key to SUPER/WINDOWS
myTerm = "alacritty"                                    # My terminal of choice
myConfig = "$HOME/.config/qtile/config.py"    # The Qtile config file location
myFont = "Hack Nerd Font"
myColors = {'black':   '#073642',
            'red':     '#dc322f',
            'green':   '#859900',
            'yellow':  '#b58900',
            'blue':    '#268bd2',
            'magenta': '#d33682',
            'cyan':    '#2aa198',
            'white':   '#eee8d5'}

##### KEYBINDINGS #####
keys = [
    # The essentials
    Key(
        [mod], "Return",
        lazy.spawn(myTerm),
        desc='Launches Terminal'
    ),
    Key(
        [mod, "shift"], "Return",
        #  lazy.spawn("dmenu_run -p 'Run: '"),
        #  desc='Dmenu Run Launcher'
        #  ),
        #  Key(['mod4'],
        lazy.run_extension(extension.DmenuRun(
            dmenu_prompt=">",
            dmenu_font='-'.join([myFont, '18']),
            background=myColors['black'],
            foreground=myColors['green'],
            selected_background=myColors['green'],
            selected_foreground=myColors['white'],
        ))),
    Key(
        [mod], "Tab",
        lazy.next_layout(),
        desc='Toggle through layouts'
    ),
    Key(
        [mod, "shift"], "c",
        lazy.window.kill(),
        desc='Kill active window'
    ),
    Key(
        [mod, "shift"], "r",
        lazy.restart(),
        desc='Restart Qtile'
    ),
    Key(
        [mod, "shift"], "q",
        lazy.shutdown(),
        desc='Shutdown Qtile'
    ),
    # Switch focus to specific monitor (out of three)
    Key([mod], "w",
        lazy.to_screen(0),
        desc='Keyboard focus to monitor 1'
        ),
    Key([mod], "e",
        lazy.to_screen(1),
        desc='Keyboard focus to monitor 2'
        ),
    # Switch focus of monitors
    Key([mod], "period",
        lazy.next_screen(),
        desc='Move focus to next monitor'
        ),
    Key([mod], "comma",
        lazy.prev_screen(),
        desc='Move focus to prev monitor'
        ),
    # Treetab controls
    #  Key([mod, "control"], "k",
    #      lazy.layout.section_up(),
    #      desc='Move up a section in treetab'
    #      ),
    #  Key([mod, "control"], "j",
    #      lazy.layout.section_down(),
    #      desc='Move down a section in treetab'
    #      ),
    # Window controls
    Key(
        [mod], "k",
        lazy.layout.down(),
        desc='Move focus down in current stack pane'
    ),
    Key(
        [mod], "j",
        lazy.layout.up(),
        desc='Move focus up in current stack pane'
    ),
    Key(
        [mod, "shift"], "k",
        lazy.layout.shuffle_down(),
        desc='Move windows down in current stack'
    ),
    Key(
        [mod, "shift"], "j",
        lazy.layout.shuffle_up(),
        desc='Move windows up in current stack'
    ),
    Key(
        [mod], "h",
        lazy.layout.grow(),
        lazy.layout.increase_nmaster(),
        desc='Expand window (MonadTall), increase number in master pane (Tile)'
    ),
    Key(
        [mod], "l",
        lazy.layout.shrink(),
        lazy.layout.decrease_nmaster(),
        desc='Shrink window (MonadTall), decrease number in master pane (Tile)'
    ),
    Key(
        [mod], "n",
        lazy.layout.normalize(),
        desc='normalize window size ratios'
    ),
    Key(
        [mod], "m",
        lazy.layout.maximize(),
        desc='toggle window between minimum and maximum sizes'
    ),
    Key(
        [mod, "shift"], "f",
        lazy.window.toggle_floating(),
        desc='toggle floating'
    ),
    # Stack controls
    Key(
        [mod, "shift"], "space",
        lazy.layout.rotate(),
        lazy.layout.flip(),
        desc='Switch which side main pane occupies (XmonadTall)'
    ),
    Key(
        [mod], "space",
        lazy.layout.next(),
        desc='Switch window focus to other pane(s) of stack'
    ),
    Key(
        [mod, "control"], "Return",
        lazy.layout.toggle_split(),
        desc='Toggle between split and unsplit sides of stack'
    ),
    # My applications launched with SUPER + ALT + KEY
    Key(
        [mod, "mod1"], "b",
        lazy.spawn("brave"),
        desc='Brave browser'
    ),
    Key(
        [mod, "mod1"], "m",
        lazy.spawn("spotify"),
        desc='Spotify'
    ),
    Key(
        [mod, "mod1"], "s",
        lazy.spawn("spicy"),
        desc='Spicy'
    ),
    Key(
        [mod, "mod1"], "v",
        lazy.spawn("virt-manager"),
        desc='Virt Manager'
    ),
    Key(
        [mod, "mod1"], "h",
        lazy.spawn("vmware-view"),
        desc='VMWare Horizon'
    ),
    Key(
        [mod, "mod1"], "c",
        lazy.spawn("code"),
        desc='VSCode'
    ),
    #  Key(
    #      [], "3270_PrintScreen",
    #      lazy.spawn("spectacle"),
    #      desc="Print Screen"
    #  ),
    #  Key(
    #      [mod, "mod1"], "v",
    #      lazy.spawn(myTerm+" -e vim"),
    #      desc='vim'
    #      ),
]

##### GROUPS #####
group_names = [(" WWW", {'layout': 'max'}),
               (" DEV", {'layout': 'monadtall'}),
               (" SYS", {'layout': 'monadtall'}),
               (" VM", {'layout': 'monadtall'}),
               (" MUS", {'layout': 'max'}),
               (" VID", {'layout': 'max'})]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    # Switch to another group
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))
    # Send current window to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name)))

##### DEFAULT THEME SETTINGS FOR LAYOUTS #####
layout_theme = {"border_width": 3,
                "margin": 6,
                "border_focus": myColors['green'],
                "border_normal": myColors['black']
                }

##### THE LAYOUTS #####
layouts = [
    # layout.MonadWide(**layout_theme),
    # layout.Bsp(**layout_theme),
    #layout.Stack(stacks=2, **layout_theme),
    # layout.Columns(**layout_theme),
    # layout.RatioTile(**layout_theme),
    # layout.VerticalTile(**layout_theme),
    # layout.Matrix(**layout_theme),
    # layout.Zoomy(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    #  layout.Tile(shift_windows=True, **layout_theme),
    #  layout.Stack(num_stacks=2),
    layout.Floating(**layout_theme)
]

##### COLORS #####
colors = [[myColors["black"], myColors["black"]],  # panel background
          # background for current screen tab
          [myColors["green"], myColors["green"]],
          [myColors["white"], myColors["white"]],  # font color for group names
          # border line color for current tab
          [myColors["red"], myColors["red"]],
          # border line color for other tab and odd widgets
          [myColors["cyan"], myColors["cyan"]],
          [myColors["green"], myColors["green"]],  # color for the even widgets
          [myColors["green"], myColors["green"]]]  # window name

##### PROMPT #####
prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

##### DEFAULT WIDGET SETTINGS #####
widget_defaults = dict(
    font=myFont,
    fontsize=16,
    padding=2,
    background=colors[2]
)
extension_defaults = widget_defaults.copy()

##### WIDGETS #####


def init_widgets_list():
    widgets_list = [
        widget.Sep(
            linewidth=0,
            padding=6,
            foreground=colors[2],
            background=colors[0]
        ),
        widget.GroupBox(font=myFont,
                        # padding_x=8,
                        fontsize=20,
                        spacing=0,
                        disable_drag=True,
                        active=myColors['white'],
                        inactive=myColors['white'],
                        rounded=False,
                        highlight_method="block",
                        this_current_screen_border=myColors['green'],
                        this_screen_border=myColors['blue'],
                        other_current_screen_border=myColors['cyan'],
                        other_screen_border=myColors['cyan'],
                        foreground=myColors['white'],
                        background=myColors['black']
                        ),
        widget.Prompt(
            prompt=prompt,
            font=myFont,
            padding=12,
            foreground=colors[3],
            background=colors[1]
        ),
        widget.Sep(
            linewidth=0,
            padding=8,
            foreground=colors[2],
            background=colors[0]
        ),
        widget.WindowName(
            fontsize=16,
            foreground=myColors['green'],
            background=myColors['black'],
            padding=0
        ),
        widget.TextBox(
            text=" 🌡",
            padding=2,
            foreground=colors[2],
            background=colors[5],
            fontsize=16
        ),
        widget.ThermalSensor(
            foreground=colors[2],
            background=colors[5],
            padding=5
        ),
        widget.TextBox(
            text=" ⟳",
            padding=2,
            foreground=colors[2],
            background=colors[4],
            fontsize=16
        ),
        widget.Pacman(
            execute=' '.join([myTerm, '-e', 'sudo', 'pacman', '-Syu']),
            update_interval=300,
            foreground=colors[2],
            background=colors[4]
        ),
        widget.TextBox(
            text="Updates",
            padding=5,
            foreground=colors[2],
            background=colors[4]
        ),
        widget.TextBox(
            text=" Vol:",
            foreground=colors[2],
            background=colors[5],
            padding=0
        ),
        widget.Volume(
            foreground=colors[2],
            background=colors[5],
            padding=5
        ),
        widget.CurrentLayoutIcon(
            custom_icon_paths=[os.path.expanduser(
                "$HOME/.config/qtile/icons")],
            foreground=colors[0],
            background=colors[4],
            padding=0,
            scale=0.7
        ),
        widget.CurrentLayout(
            foreground=colors[2],
            background=colors[4],
            padding=5
        ),
        widget.Clock(
            foreground=colors[2],
            background=colors[5],
            padding=5,
            format="%A, %d %B [ %H:%M ]"
        ),
        widget.Sep(
            linewidth=0,
            padding=5,
            foreground=colors[0],
            background=colors[5]
        ),
        widget.Systray(
            background=myColors['black'],
            padding=5
        ),
        widget.Sep(
            linewidth=0,
            padding=5,
            background=myColors['black']
        ),
    ]
    return widgets_list

# SCREENS ##### (TRIPLE MONITOR SETUP)


def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    # Slicing removes unwanted widgets on Monitors 1,3
    return widgets_screen1


def init_widgets_screen2():
    widgets_screen2 = init_widgets_list()
    # Monitor 2 will display all widgets in widgets_list
    return widgets_screen2


def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_screen1(), opacity=0.95, size=28)),
            Screen(top=bar.Bar(widgets=init_widgets_screen2(), opacity=0.95, size=28))]


if __name__ in ["config", "__main__"]:
    screens = init_screens()
    widgets_list = init_widgets_list()
    widgets_screen1 = init_widgets_screen1()
    widgets_screen2 = init_widgets_screen2()

##### DRAG FLOATING WINDOWS #####
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button2", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button3", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

##### FLOATING WINDOWS #####
floating_layout = layout.Floating(float_rules=[
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

##### STARTUP APPLICATIONS #####
@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
