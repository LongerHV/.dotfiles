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

