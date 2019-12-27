# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.cargo/bin/:$PATH
export GO111MODULE=on
export GOPATH=/home/idursun/go/
export ZSH="/home/idursun/.oh-my-zsh"

ZSH_THEME="spaceship"
DISABLE_UPDATE_PROMPT="true"
plugins=(
    git
    vi-mode
    archlinux
    cargo
    docker
    kubectl
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias ls="exa"
alias ll="exa -l"
alias k="kubectl"

autoload compinit
compinit

SPACESHIP_DIR_PREFIX=""
