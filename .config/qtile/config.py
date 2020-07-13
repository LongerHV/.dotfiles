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
import subprocess
from typing import List  # noqa: F401
from libqtile.config import Key, Screen, Group, Drag, Click, ScratchPad, DropDown
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook, extension
from mylib import BGroupBox

##### DEFINING SOME VARIABLES #####
MOD = "mod4"  # Sets mod key to SUPER/WINDOWS
ALT = "mod1"
MYTERM = "alacritty"
MYFONT = "Hack Nerd Font"
MYCOLORS = {
    'black':   '#073642',
    'red':     '#dc322f',
    'green':   '#859900',
    'yellow':  '#b58900',
    'blue':    '#268bd2',
    'magenta': '#d33682',
    'cyan':    '#2aa198',
    'white':   '#eee8d5'}

BLACK = MYCOLORS['black']
RED = MYCOLORS['red']
GREEN = MYCOLORS['green']
YELLOW = MYCOLORS['yellow']
BLUE = MYCOLORS['blue']
MAGENTA = MYCOLORS['magenta']
CYAN = MYCOLORS['cyan']
WHITE = MYCOLORS['white']

##### KEYBINDINGS #####
keys = [
    # The essentials
    Key([MOD], "Return",
        lazy.spawn(MYTERM),
        desc='Launches Terminal'),
    Key([MOD, "shift"], "Return",
        lazy.run_extension(extension.DmenuRun(
            dmenu_prompt=">",
            dmenu_font='-'.join([MYFONT, '18']),
            background=BLACK,
            foreground=GREEN,
            selected_background=GREEN,
            selected_foreground=WHITE))),
    Key([MOD], "Tab",
        lazy.next_layout(),
        desc='Toggle through layouts'),
    Key([MOD, "shift"], "c",
        lazy.window.kill(),
        desc='Kill active window'),
    Key([MOD, "shift"], "r",
        lazy.restart(),
        desc='Restart Qtile'),
    Key([MOD, "shift"], "q",
        lazy.shutdown(),
        desc='Shutdown Qtile'),
    Key([MOD, "shift"], "l",
        lazy.spawn("light-locker-command -l"),
        desc='Lock screen'),
    # Switch focus to specific monitor (out of three)
    Key([MOD], "w",
        lazy.to_screen(0),
        desc='Keyboard focus to monitor 1'),
    Key([MOD], "e",
        lazy.to_screen(1),
        desc='Keyboard focus to monitor 2'),
    # Switch focus of monitors
    Key([MOD], "period",
        lazy.next_screen(),
        desc='Move focus to next monitor'),
    Key([MOD], "comma",
        lazy.prev_screen(),
        desc='Move focus to prev monitor'),
    # Treetab controls
    #  Key([MOD, "control"], "k",
    #      lazy.layout.section_up(),
    #      desc='Move up a section in treetab'
    #      ),
    #  Key([MOD, "control"], "j",
    #      lazy.layout.section_down(),
    #      desc='Move down a section in treetab'
    #      ),
    # Window controls
    Key([MOD], "k",
        lazy.layout.down(),
        desc='Move focus down in current stack pane'),
    Key([MOD], "j",
        lazy.layout.up(),
        desc='Move focus up in current stack pane'),
    Key([MOD, "shift"], "k",
        lazy.layout.shuffle_down(),
        desc='Move windows down in current stack'),
    Key([MOD, "shift"], "j",
        lazy.layout.shuffle_up(),
        desc='Move windows up in current stack'),
    Key([MOD], "h",
        lazy.layout.grow(),
        lazy.layout.increase_nmaster(),
        desc='Expand window (MonadTall), increase number in master pane (Tile)'),
    Key([MOD], "l",
        lazy.layout.shrink(),
        lazy.layout.decrease_nmaster(),
        desc='Shrink window (MonadTall), decrease number in master pane (Tile)'),
    Key([MOD], "n",
        lazy.layout.normalize(),
        desc='normalize window size ratios'),
    Key([MOD], "m",
        lazy.layout.maximize(),
        desc='toggle window between minimum and maximum sizes'),
    Key([MOD, "shift"], "f",
        lazy.window.toggle_floating(),
        desc='toggle floating'),
    # Stack controls
    Key([MOD, "shift"], "space",
        lazy.layout.rotate(),
        lazy.layout.flip(),
        desc='Switch which side main pane occupies (XmonadTall)'),
    Key([MOD], "space",
        lazy.layout.next(),
        desc='Switch window focus to other pane(s) of stack'),
    Key([MOD, "control"], "Return",
        lazy.layout.toggle_split(),
        desc='Toggle between split and unsplit sides of stack'),
    # My applications launched with SUPER + ALT + KEY
    Key([MOD, ALT], "b",
        lazy.spawn("brave"),
        desc='Brave browser'),
    Key([MOD, ALT], "m",
        lazy.spawn("spotify"),
        desc='Spotify'),
    Key([MOD, ALT], "s",
        lazy.spawn("spicy"),
        desc='Spicy'),
    Key([MOD, ALT], "v",
        lazy.spawn("virt-manager"),
        desc='Virt Manager'),
    Key([MOD, ALT], "h",
        lazy.spawn("vmware-view"),
        desc='VMWare Horizon'),
    Key([MOD, ALT], "c",
        lazy.spawn("code"),
        desc='VSCode'),
    Key([MOD, ALT], "g",
        lazy.spawn("steam"),
        desc='Steam'),
    Key([MOD, ALT], "t",
        lazy.spawn("teams"),
        desc='Teams'),
    Key([MOD, ALT], "f",
        lazy.spawn("thunar"),
        desc='File manager'),
    Key([], "F12",
        lazy.group["scratchpad"].dropdown_toggle('term'),
        desc='Dropdown terminal'),
    #  Key([MOD, ALT], "Return",
    #      lazy.group["ScratchPad"].dropdown_toggle(MYTERM),
    #      desc='Dropdown terminal'),
    Key(
        # [], "3270_PrintScreen",
        [MOD], "Insert",
        lazy.spawn("screengrab"),
        desc="Print Screen"
    ),
    #  Key(
    #      [MOD, ALT], "v",
    #      lazy.spawn(MYTERM+" -e vim"),
    #      desc='vim'
    #      ),
]

##### GROUPS #####
group_names = [
    (" WWW", {'layout': 'max'}),
    (" DEV", {'layout': 'max'}),
    (" SYS", {'layout': 'monadtall'}),
    (" VRT", {'layout': 'max'}),
    (" MUS", {'layout': 'max'}),
    (" VID", {'layout': 'max'}),
    (" FUN", {'layout': 'max'}),
    (" MSG", {'layout': 'max'})
]

groups = [Group(name, **kwargs) for name, kwargs in group_names]
drop_term = DropDown('term', MYTERM, width=0.9, height=0.9,
                     x=0.05, y=0.05, opacity=1.0,
                     on_focus_lost_hide=False)
groups.append(ScratchPad('scratchpad', [drop_term]))

for i, (name, kwargs) in enumerate(group_names, 1):
    # Switch to another group
    keys.append(Key([MOD], str(i), lazy.group[name].toscreen()))
    # Send current window to another group
    keys.append(Key([MOD, "shift"], str(i), lazy.window.togroup(name)))

##### DEFAULT THEME SETTINGS FOR LAYOUTS #####
layout_theme = {"border_width": 3,
                "margin": 6,
                "border_focus": GREEN,
                "border_normal": BLACK
                }

##### THE LAYOUTS #####
layouts = [
    # layout.Bsp(**layout_theme),
    # layout.Stack(stacks=2, **layout_theme),
    # layout.Columns(**layout_theme),
    # layout.RatioTile(**layout_theme),
    # layout.VerticalTile(**layout_theme),
    # layout.Matrix(**layout_theme),
    # layout.Zoomy(**layout_theme),
    #  layout.Tile(shift_windows=True, **layout_theme),
    #  layout.Stack(num_stacks=2),
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.Max(**layout_theme),
    #  layout.Floating(**layout_theme)
]

##### DEFAULT WIDGET SETTINGS #####
widget_defaults = dict(
    font=MYFONT,
    fontsize=16,
    padding=2,
    background=BLACK
)
extension_defaults = widget_defaults.copy()

##### WIDGETS #####

widgets_list1 = [
    widget.GroupBox(
        font=MYFONT,
        fontsize=20,
        spacing=0,
        disable_drag=True,
        active=WHITE,
        inactive=WHITE,
        rounded=False,
        highlight_method="block",
        this_current_screen_border=GREEN,
        this_screen_border=CYAN,
        other_current_screen_border=BLACK,
        other_screen_border=BLACK,
        foreground=WHITE,
        background=BLACK
    ),
    widget.Sep(
        linewidth=0,
        padding=8,
        background=BLACK
    ),
    widget.WindowName(
        fontsize=16,
        foreground=GREEN,
        background=BLACK,
        padding=0
    ),
    widget.Systray(
        background=BLACK,
        padding=5
    ),
    widget.Sep(
        linewidth=0,
        padding=5,
        background=BLACK
    ),
    widget.TextBox(
        text=" ",
        padding=2,
        foreground=WHITE,
        background=GREEN,
        fontsize=16
    ),
    widget.ThermalSensor(
        tag_sensor="Package id 0",
        foreground=WHITE,
        background=GREEN,
        padding=5
    ),
    widget.TextBox(
        text=" ⟳",
        padding=2,
        foreground=WHITE,
        background=CYAN,
        fontsize=16
    ),
    widget.Pacman(
        execute=' '.join([MYTERM, '-e', 'sudo', 'pacman', '-Syu']),
        update_interval=18000,
        foreground=WHITE,
        background=CYAN,
    ),
    widget.TextBox(
        text="Updates",
        padding=5,
        foreground=WHITE,
        background=CYAN,
    ),
    widget.TextBox(
        text=" Vol:",
        foreground=WHITE,
        background=GREEN,
        padding=0
    ),
    widget.Volume(
        foreground=WHITE,
        background=GREEN,
        padding=5
    ),
    widget.CurrentLayoutIcon(
        custom_icon_paths=[os.path.expanduser(
            "$HOME/.config/qtile/icons")],
        foreground=WHITE,
        background=CYAN,
        padding=0,
        scale=0.7
    ),
    widget.CurrentLayout(
        foreground=WHITE,
        background=CYAN,
        padding=5
    ),
    widget.Clock(
        foreground=WHITE,
        background=GREEN,
        padding=5,
        format="%A, %d %B [ %H:%M ]"
    ),
    widget.Sep(
        linewidth=0,
        padding=5,
        background=GREEN
    )
]


widgets_list2 = [
    #  widget.AGroupBox(
    #      font=MYFONT,
    #      fontsize=20,
    #      borderwidth=0,
    #      foreground=WHITE,
    #      background=GREEN
    #  ),
    BGroupBox(
        font=MYFONT,
        fontsize=20,
        borderwidth=0,
        foreground=WHITE,
        this_current_screen_border=GREEN,
        this_screen_border=CYAN,
    ),
    widget.Sep(
        linewidth=0,
        padding=12,
        background=BLACK
    ),
    widget.WindowName(
        fontsize=16,
        foreground=GREEN,
        background=BLACK,
        padding=0
    ),
    widget.CurrentLayoutIcon(
        custom_icon_paths=[os.path.expanduser(
            "$HOME/.config/qtile/icons")],
        foreground=WHITE,
        background=CYAN,
        padding=0,
        scale=0.7
    ),
    widget.CurrentLayout(
        foreground=WHITE,
        background=CYAN,
        padding=5
    ),
    widget.Clock(
        foreground=WHITE,
        background=GREEN,
        padding=5,
        format="%A, %d %B [ %H:%M ]"
    ),
    widget.Sep(
        linewidth=0,
        padding=5,
        background=GREEN
    )
]


# SCREENS ##### (DUAL MONITOR SETUP)
myScreens = [Screen(top=bar.Bar(widgets=widgets_list1, opacity=0.95, size=28)),
             Screen(top=bar.Bar(widgets=widgets_list2, opacity=0.95, size=28))]


if __name__ in ["config", "__main__"]:
    screens = myScreens
    widgets_list = widgets_list1
    widgets_screen1 = widgets_list2

##### DRAG FLOATING WINDOWS #####
mouse = [
    Drag([MOD], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([MOD], "Button2", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([MOD], "Button3", lazy.window.bring_to_front())
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
    {'wname': 'Connect to SPICE'},
    {'wname': 'Steam'},
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
    {'wmclass': 'Steam'},
    {'wmclass': 'lxpolkit'},
    {'wmclass': 'redshift-gtk'}
], **layout_theme)

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
