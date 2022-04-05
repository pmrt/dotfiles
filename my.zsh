export TYPEWRITTEN_SYMBOL="λ"
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
bindkey '^R' history-incremental-search-backward
bindkey -v

plugins=(zsh-fzf-history-search)
# Set typewritten ZSH as a prompt
autoload -U promptinit; promptinit
prompt typewritten

alias tm="tmux new -s $1"
alias tma="tmux attach -t $1"
alias sv="mosh pj@116.203.104.224"
# alias nvim="lvim"
alias lg="lazygit"
alias pubip="curl ifconfig.co"

# Projects
alias nv1="cd ~/Desktop/github.com/hammertrack/tracker && nvim"
alias nv2="cd ~/Desktop/github.com/hammertrack/webserver && nvim"
alias nv3="cd ~/Desktop/github.com/hammertrack/api && nvim"
alias nv4="cd ~/Desktop/github.com/hammertrack/hammertrack.com && nvim"
alias nvc="cd ~/.config/nvim && nvim"

# Exports
export GO111MODULE=on
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=nvim
