# If you come from bash you might have to change your $PATH.
export ZSH="/home/idursun/.oh-my-zsh"
export PATH="$HOME/.node_modules/bin:$HOME/bin:$HOME/.linkerd2/bin:$HOME/dapr:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export _JAVA_AWT_WM_NONREPARENTING=1

DISABLE_UPDATE_PROMPT="true"
plugins=(
    git
    vi-mode
    archlinux
    cargo
    docker
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

eval "$(starship init zsh)"
eval $(keychain --eval --quiet)

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -U +X compinit && compinit

source /home/idursun/.config/broot/launcher/bash/br
