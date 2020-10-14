# Default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
ZSHCACHE=$HOME/.cache/zsh
HISTFILE=$ZSHCACHE/history
test -e $ZSHCACHE || mkdir $ZSHCACHE
test -f $HISTFILE || touch $HISTFILE

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# zsh plugin configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=13,regular,underline"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# source plugins and theme
plugins=$HOME/.zsh_custom/plugins
source $plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source $plugins/zsh-completions/zsh-completions.plugin.zsh
source $plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
source $plugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh

# zsh plugin bindkeys
bindkey '^ ' autosuggest-accept
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down 

# load completions
autoload -Uz compinit && compinit
zstyle ':completion:*' menu yes select

# load configs
for f in $HOME/.config/zsh/*; do source "$f"; done

# run neofetch for extra flex
if [ $(whoami) != 'root' ]
then
    neofetch --gtk2 off --gtk3 off
fi

source /home/longer/.config/broot/launcher/bash/br
