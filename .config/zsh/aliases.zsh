# alias for managing dotfiles git bare repo
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

cfg () {
    config add -u \
    && config commit -m "$1" \
    && config push origin master
}

vv () {
    if [ -d .venv ];
    then
        source .venv/bin/activate
    elif [ -d venv ];
    then
        source venv/bin/activate
    else
        python -m venv .venv
        source .venv/bin/activate
        python -m pip install pynvim flake8 autopep8
    fi
}

# fix tldr
alias tldr='LANG=en_US.utf8 tldr'

# aliases for config editing
alias cq='$EDITOR $HOME/.config/qtile/config.py'
alias ca='$EDITOR $HOME/.config/alacritty/alacritty.yml'
alias cv='$EDITOR $HOME/.vim/vimrc'
alias cz='$EDITOR $HOME/.zshrc'

# aliases for ls
alias ll='ls -lh --color=always'
alias la='ls -lah --color=always'

# aliases for personal scripts
alias paser='/bin/sh $HOME/scripts/paser.sh'

