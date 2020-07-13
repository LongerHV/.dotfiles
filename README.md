# dotfiles

![qtile screen](/Obrazy/qtile_shot.png)

## Content:

- qtile contiguration (dual monitor)

- alacritty configuration

- vim configuration (with plugons as submodules)

- zsh configuration (with plugins as submodules)

- Hack Nerd Font

Qtile and Alacritty configured to use solarized dark theme,
GUI applications use materia-dark theme

## Dependencies:

- zsh

- spaceship zsh prompt

- vim

- qtile

- alacritty

- dmenu

- picom

- lxsession (for polkit)

- nitrogen

- thunar

- LightDM

- Lightlocker

# Other used programs

- Brave browser

- Jack2

- redshift-gtk

- lxappearance

- kvantum

## Clone and initialize:

git clone --bare https://gitlab.com/LongerHV/.dotfiles $HOME/.dotfiles

git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout -f

source $HOME/.zshrc

config submodule update --init --recursive

cd $HOME/.vim/bundle/youcompleteme

python3 install.py --all

## Update submodules:
config submodule foreach git pull origin master

config status

config add -u

config commit -m "message"

config push origin master
