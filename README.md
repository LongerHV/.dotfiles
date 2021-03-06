# dotfiles

![qtile screen](/Obrazy/qtile_shot.png)

## Content:

- qtile contiguration

- alacritty configuration

- nvim configuration

- zsh configuration (with plugins as submodules)

- Hack Nerd Font

Qtile and Alacritty configured to use Oceanic theme

GUI applications use adapta theme

## Dependencies:

- zsh

- nvim

- qtile

- alacritty

- dmenu

- picom

- lxqt-session (for polkit)
	
- pcmanfm-qt

- nitrogen

- LightDM

- Light-locker

### Other used programs:

- Brave browser

- pipewire, pipewire-pulse, pipewire-jack (+ cadence, pavucontrol-qt)

- redshift-gtk

- qt5ct

- kvantum

- adapta-gtk-theme

## Qtile keybindings

| Keybinding | Action |
| :--- | :--- |
| `SUPER + RETURN` | open terminal |
| `SUPER + SHIFT + RETURN` | open dmenu |
| `SUPER + TAB` | toggle layouts |
| `SUPER + SHIFT + c` | kill active window |
| `SUPER + SHIFT + q` | quit qtile |
| `SUPER + SHIFT + r` | restart qtile |
| `SUPER + SHIFT + l` | lock screen |
| `SUPER +  w` | focus on monitor 1 |
| `SUPER +  e` | focus on monitor 2 |
| `SUPER +  ,` | focus on prev monitor |
| `SUPER +  .` | focus on next monitor |
| `SUPER +  j` | focus down in stack |
| `SUPER +  k` | focus up in stack |
| `SUPER +  h` | grow master size |
| `SUPER +  l` | shrink master size |
| `SUPER +  n` | normalize ratios |
| `SUPER +  m` | toggle min/max size |
| `SUPER + SHIFT +  SPACE` | swap panes |
| `SUPER + ALT + b` | open Brave |
| `SUPER + ALT + m` | open Spotify |
| `SUPER + ALT + s` | open Spicy |
| `SUPER + ALT + v` | open Virt-manager |
| `SUPER + ALT + c` | open VSCode |
| `SUPER + ALT + g` | open Steam |
| `SUPER + ALT + f` | open File manager |
| `F12` | open dropdown terminal |

## Clone and initialize:

git clone --bare https://gitlab.com/LongerHV/.dotfiles.git $HOME/.dotfiles

git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout -f

source $HOME/.zshrc

config submodule update --init --recursive

## Update submodules:
config submodule foreach git pull origin master

config status

cfg "message"
