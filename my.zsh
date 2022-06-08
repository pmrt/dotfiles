export TYPEWRITTEN_SYMBOL="λ"
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
bindkey '^R' history-incremental-search-backward
bindkey -v

plugins=(zsh-fzf-history-search)
# Set typewritten ZSH as a prompt
autoload -Uz promptinit; promptinit
prompt typewritten

alias tm="tmux new -s $1"
alias tma="tmux attach -t $1"
alias sv="mosh pj@116.203.104.224"
# alias nvim="lvim"
alias lg="lazygit"
alias pubip="curl ifconfig.co"

# Projects
alias nv1="cd ~/Desktop/tangente && nvim"
alias nvc="cd ~/.config/nvim && nvim"
alias cam="ffplay rtsp://192.168.1.246:8554/stream1 -vf \"setpts=N/30\" -fflags nobuffer -flags low_delay -framedrop"

# Exports
export GO111MODULE=on
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=nvim

export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/snap/bin
export PATH="~/python/bin:${PATH}"
export PATH=$HOME/go/bin:$PATH
export PATH=$HOME/.config/nvim/bin:$PATH
#export PATH=/usr/local/bin:$PATH
export FZF_DEFAULT_COMMAND="rg --files --hidden -g '!yarn.lock' -g '!node_modules/*' -g'!dist/*' -g '!.git/*'"
export PATH=$HOME/.npm-global/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
