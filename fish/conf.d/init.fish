# theme
set -g theme_display_time yes
set -g theme_display_group no
set -x VIRTUAL_ENV_DISABLE_PROMPT 1
set -g theme_powerline_fonts no
set -g theme_display_date yes
set -g theme_show_exit_status yes
set -g theme_title_use_abbreviated_path no
set -g theme_display_user yes
set -g theme_display_hostname yes
set -g theme_newline_cursor yes

# editor
set -gx EDITOR vim
set -Ux EDITOR vim
set -U GIT_EDITOR vim
set -U VISUAL vim
set -U TERM xterm

# terminal
set -lx TERM xterm
set TERM xterm

# recursive search
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

set PATH $PATH $HOME/.bin/

# Enable CTRL + t
fzf_key_bindings

set fish_color_search_match --background='484848'