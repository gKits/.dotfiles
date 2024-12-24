export ZSH=$HOME/.config/zsh

# history config
HISTFILE=$ZSH/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

# source themes and plugins
source $ZSH/themes/spaceship-prompt/spaceship.zsh-theme
source $ZSH/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fpath=($ZSH/plugins/zsh-completions/src $fpath)

# spaceship config
SPACESHIP_PROMPT_ORDER=(
  user
  dir
  host
  git
  golang
  exec_time
  line_sep
  jobs
  exit_code
  char
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "

export GOPATH=$HOME/go
export PATH=/$HOME/.local/bin:$PATH
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH

source <(fzf --zsh)

alias nv="nvim"
alias vim="nvim"
alias la="ls -lAC --color=auto"
alias ll="ls -ophA --color=auto --time-style=iso"
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Image}}\t{{.ID}}"'
