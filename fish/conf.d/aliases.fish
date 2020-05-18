# My Aliases

# AWS
alias aws="$HOME/.pyenv/versions/awscli/bin/aws"

# Kubernetes
alias kx="kubectx"
alias kn="kubens"
alias kk="kubectl"
alias ls="exa"
alias ek="eksctl"
alias mkk="microk8s.kubectl"

# Terminal
alias icat="kitty +kitten icat "
alias kdiff="kitty +kitten diff "
alias i3conf="vi ~/.config/i3/config"
alias pdf="/usr/bin/xdg-open"
alias py3="python3"
#alias s="sshx"
alias m="mosh"
#alias ssh="s"
alias rr="ranger"
alias mc="mc -S nicedark"
alias zs="vi ~/.zshrc"
alias ls="exa --header"
alias ll="exa --long --header --git"
alias tree="exa --tree"
alias vi="vim"

function vf
  du -a . | awk '{print $2}' | fzf | xargs -r $EDITOR
end

# EXA
alias ls="exa --header"
alias ll="exa --long --header --git"
alias tree="exa --tree"

# FISH
alias hp="set -g fish_prompt_pwd_dir_length 1" # Hide full path
alias sp="set -g fish_prompt_pwd_dir_length 0" # Show full path
alias von="fish_vi_key_bindings"               # Set VIM mode
alias voff="fish_default_key_bindings"         # Set VIM mode

alias gc="git branch | fzf | xargs -r -I {} git checkout {}"
alias psearch="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"

function fssh -d "Fuzzy-find ssh host via ag and ssh into it"
  ag --ignore-case '^host [^*]' ~/.ssh/config | cut -d ' ' -f 2 | fzf | read -l result; and ssh "$result"
end

