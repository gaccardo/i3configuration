#!/usr/bin/fish

set MODULES cd fish-spec git-flow foreign-env nvm pyenv bobthefish

for module in $MODULES

  if test -e ~/.local/share/omg/pkg/$module
    echo "ignoring $module because is already installed"
  else
    echo installing $module
    omf install $module
  end

end
