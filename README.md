# dotfiles

Execute following commands to clone and initialize:

  git clone --bare https://github.com/LongerHV/.dotfiles $HOME/.dotfiles

  git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout -f

  config submodule update --init --recursive

  cd $HOME/.vim/bundle/youcompleteme

  python3 install.py --all

In order to update submodules do following:

config submodule foreach git pull origin master

config status

config add <module_path> (for each updated subomdule)

config commit -m "message"

config push origin master

