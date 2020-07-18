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
HISTFILE=~/.cache/zsh/history

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# zsh plugin bindkeys
bindkey '^ ' autosuggest-accept
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down 

# zsh plugin configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=13,regular,underline"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# source plugins
source $HOME/.zsh_custom/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $HOME/.zsh_custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source $HOME/.zsh_custom/plugins/zsh-completions/zsh-completions.plugin.zsh
source $HOME/.zsh_custom/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh

# add broot command
source $HOME/.config/broot/launcher/bash/br
alias br='br -h'

# run neofetch for extra flex
neofetch --gtk2 off --gtk3 off

# alias for managing dotfiles git bare repo
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

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
SPACESHIP_HOST_SHOW=always
SPACESHIP_DIR_PREFIX=""
SPACESHIP_CHAR_SYMBOL=$
SPACESHIP_CHAR_SUFFIX=" "

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  line_sep      # Line break
  exit_code     # Exit code section
  char          # Prompt character
)

autoload -U promptinit; promptinit
prompt spaceship

