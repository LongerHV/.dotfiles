# Spaceship Prompt
if [ $(whoami) = 'root' ]
then
    color='red'
else
    color='green'
fi

SPACESHIP_USER_SHOW=always
SPACESHIP_USER_SUFFIX=""
SPACESHIP_USER_COLOR=$color
SPACESHIP_HOST_SHOW=always
SPACESHIP_HOST_PREFIX="%F{$color}@"
SPACESHIP_HOST_COLOR=$color
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

