# fpath
fpath=(
    $HOME/.zsh_custom/plugins/zsh-completions
    $fpath
)

# Default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
test -e $HOME/.cache/zsh \
    || mkdir $HOME/.cache/zsh
test -f $HOME/.cache/zsh/history \
    || touch $HOME/.cache/zsh/history
HISTFILE=~/.cache/zsh/history

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# zsh plugin configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=13,regular,underline"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# source plugins and theme
plugins=$HOME/.zsh_custom/plugins
themes=$HOME/.zsh_custom/themes
source $plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source $plugins/zsh-completions/zsh-completions.plugin.zsh
source $plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
source $themes/spaceship-prompt/spaceship.zsh-theme

# zsh plugin bindkeys
bindkey '^ ' autosuggest-accept
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down 

# add broot command
source $HOME/.config/broot/launcher/bash/br
alias br='br -h'

# run neofetch for extra flex
neofetch --gtk2 off --gtk3 off

# alias for managing dotfiles git bare repo
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

cfg () {
    config add -u \
    && config commit -m "$1" \
    && config push origin master
}

# fix tldr
alias tldr='LANG=en_US.utf8 tldr'

# aliases for config editing
alias cq='$EDITOR $HOME/.config/qtile/config.py'
alias ca='$EDITOR $HOME/.config/alacritty/alacritty.yml'
alias cv='$EDITOR $HOME/.vim/vimrc'
alias cz='$EDITOR $HOME/.zshrc'

# aliases for ls
alias ll='ls -l'
alias la='ls -la'

# aliases for personal scripts
alias paser='/bin/sh $HOME/scripts/paser.sh'

# load completions
autoload -Uz compinit && compinit
zstyle ':completion:*' menu yes select

# Spaceship Prompt
SPACESHIP_USER_SHOW=always
SPACESHIP_USER_SUFFIX=""
SPACESHIP_USER_COLOR="green"
SPACESHIP_HOST_SHOW=always
SPACESHIP_HOST_PREFIX="%F{green}@"
SPACESHIP_HOST_COLOR="green"
SPACESHIP_DIR_SHOW=always
SPACESHIP_DIR_PREFIX=""
SPACESHIP_DIR_COLOR="blue"
SPACESHIP_CHAR_SYMBOL=$
SPACESHIP_CHAR_SYMBOL_ROOT=#
SPACESHIP_CHAR_SUFFIX=" "

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  line_sep      # Line break
  char          # Prompt character
)

