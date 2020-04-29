# dotfiles

Execute following commands to clone and initialize:

  git clone --bare https://github.com/LongerHV/dotfiles $HOME/dotfiles

  git --git-dir=$HOME/dotfiles --work-tree=$HOME checkout -f

  config submodule update --init
