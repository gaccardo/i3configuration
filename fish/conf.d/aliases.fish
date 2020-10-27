# My Aliases

# AWS
alias aws="$HOME/.pyenv/versions/awscli/bin/aws"

# Kubernetes
alias awx="awx | fzf --ansi | xargs -I {} awx {}"
alias kx="kubectx"
alias kn="kubens"
alias kk="kubectl"
alias ls="exa"
alias ek="eksctl"
alias mkk="microk8s.kubectl"
alias s="ssh"
alias ct="ctop -a"
alias kdiff="kitty +kitten diff"
alias icat="kitty +kitten icat --align left"
alias fcat="fzf --preview 'cat {}'"

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
