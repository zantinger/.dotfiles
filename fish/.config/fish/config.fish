#set -x PATH /home/miza/.nvm/versions/node/v15.7.0 $PATH
set -x PATH "$HOME/.cargo/bin" $PATH
set -x PATH "$HOME/.local/bin" $PATH
set -x PATH "$HOME/.local/bin/flutter/bin" $PATH
alias nvim="$HOME/.local/bin/nvim.appimage"
starship init fish | source