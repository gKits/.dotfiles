# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# setup zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# install p10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# install plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# install snippets
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# load completions
autoload -U compinit && compinit
zinit cdreplay -q

# history settings
HISTSIZE=5000
HISTFILE=$ZSH/.zhistory
SAVEHIST=5000
HISTDUP=erase
# setopt appendhistory
# setopt sharehistory
setopt inc_append_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# completion settings
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# shell integrations
source <(fzf --zsh)

# aliases
alias nv="nvim"
alias vim="nvim"
alias ls="ls --color=auto"
alias la="ls -lAC --color=auto"
alias ll="ls -ophA --color=auto --time-style=iso"
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Image}}\t{{.ID}}"'


# environment variables
export EDITOR=nvim

## wayland
export XDG_CURRENT_DESKTOP=sway
export MOZ_DBUS_REMOTE=1
export MOZ_ENABLE_WAYLAND=1

## go
export GOPATH=$HOME/go
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
export GOLINES_LENGTH=120

## custom scripts
export PATH=$HOME/.local/scripts:$PATH
export PATH=$HOME/.local/bin:$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
