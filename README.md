# dotfiles

![qtile screen](/Obrazy/qtile_shot.png)

## Content:

- qtile contiguration (dual monitor)

- alacritty configuration

- vim configuration (with plugons as submodules)

- zsh configuration (with oh-my-zsh and plugins as submodules)

- Hack Nerd Font

All programs configured to use solarized dark theme

## Dependencies:

- zsh

- vim

- qtile

- alacritty

- dmenu

- compton

- lxsession

- nitrogen

## Clone and initialize:

git clone --bare https://gitlab.com/LongerHV/.dotfiles $HOME/.dotfiles

git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout -f

config submodule update --init --recursive

cd $HOME/.vim/bundle/youcompleteme

python3 install.py --all

## Update submodules:
config submodule foreach git pull origin master

config status

config add <module_path> (for each updated subomdule)

config commit -m "message"

config push origin master
