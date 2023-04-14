# My Aliases

# AWS
# alias aws="$HOME/.pyenv/versions/awscli/bin/aws"

# Kubernetes
alias awx="awx | fzf --ansi | xargs -I {} awx {}"
alias kx="kubectx"
alias kn="kubens"
alias kk="kubectl"
#alias ls="exa"
alias ek="eksctl"
alias mkk="microk8s.kubectl"
alias s="ssh"
alias ct="ctop -a"
alias kdiff="kitty +kitten diff"
alias icat="kitty +kitten icat --align left"
alias fcat="fzf --preview 'cat {}'"
alias kw="watch -n 2 kubectl get"
alias bat="bat --pager=never --theme gruvbox-dark -p"
alias batf="bat --pager=never --theme gruvbox-dark --style='full'"
alias batn="bat --pager=never --theme gruvbox-dark --style='numbers'"
alias busylaunch="kubectl run -i -t busybox --image=busybox:1.28 --restart=Never"
alias kpo-nodes='kubectl get pod -o=custom-columns=NAME:.metadata.name,STATUS:.status.phase,NODE:.spec.nodeName --all-namespaces'
alias ecr-ling='aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 782253790350.dkr.ecr.us-east-1.amazonaws.com'
alias dst="dunstctl set-paused true; echo 'dunst paused'"
alias dsf="dunstctl set-paused false; echo 'dunst enabled'"


function k8s
  set k8s_status "off"
  if test $argv = "on"
    set k8s_status "yes"
  else
    set k8s_status "no"
  end

  set -g theme_display_k8s_namespace $k8s_status
  set -g theme_display_k8s_context $k8s_status
end

function ddt
  if test $theme_display_date = no
      set new_status yes
  else
      set new_status no
  end
  set -g theme_display_date $new_status
  set -g theme_display_cmd_duration $new_status
end

# Terminal
alias i3conf="vi ~/.config/i3/config"
alias pdf="/usr/bin/xdg-open"
alias rr="ranger"
alias mc="mc -S nicedark"
alias ls="exa --header"
alias ll="exa --long --header --git"
alias tree="exa --tree"
alias vi="vim"
alias bt="bashtop"
alias e="emacs"
alias randpass='openssl rand -hex $1'

function vf
  du -a . | awk '{print $2}' | fzf --ansi | xargs -r $EDITOR
end

# EXA
alias ls="exa --header"
alias ll="exa --long --header --git --classify --group --time-style=long-iso"
alias lg="exa --long --header --git --classify --group --time-style=long-iso --grid"
alias tree="exa --tree --level=2"
alias treel="exa --tree --level=2 --long --git"

# FISH
alias hp="set -g fish_prompt_pwd_dir_length 1" # Hide full path
alias sp="set -g fish_prompt_pwd_dir_length 0" # Show full path
alias von="fish_vi_key_bindings"               # Set VIM mode
alias voff="fish_default_key_bindings"         # Set VIM mode

alias psearch="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"

function fssh -d "Fuzzy-find ssh host via ag and ssh into it"
  ag --ignore-case '^host [^*]' ~/.ssh/config | cut -d ' ' -f 2 | fzf | read -l result; and ssh "$result"
end

# GIT
alias gc="git branch | fzf | xargs -r -I {} git checkout {}"
alias gs="git diff --name-only | fzf --multi --ansi --preview 'git diff --color=always -- {-1}'"

# Crypto
alias btc="/home/guido/Workspace/Personal/crypto/bitcoin.py"

# Networking
alias puip="curl 'https://api.ipify.org?format=json'"

# clipboard
alias this_path="pwd | xsel --input"
alias path_here="cd (xclip -out)"

# bridge
alias bridgecf="/home/guido/.pyenv/versions/3.9.10/envs/devops-3.9.10/bin/bridgecf"
