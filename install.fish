#!/usr/bin/env fish

function install_stow
  if command -v stow > /dev/null
  else 
    sudo apt install stow
  end
end

function fish_setup
  apt install fonts-firacode
  curl -fsSL https://starship.rs/install.sh | bash
  stow -R fish
end

function alacritty_setup
  stow -R alacritty
end

function nvim_setup 
  rm -rf "$HOME/.local/share/nvim/"
  npm uninstall -g typescript typescript-language-server \
     vscode-langservers-extracted \
     vls

  npm install -g typescript typescript-language-server \
     vscode-langservers-extracted \
     vls

  mkdir -p "$HOME/.local/share/nvim/site/pack/packer/start"
  git clone https://github.com/wbthomason/packer.nvim\
 "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"

  stow -R nvim
end


# requirements
# fishshell neovim node npm
#
# uncomment to run scripts
#
#install_stow
#fish_setup
#alacritty_setup
#nvim_setup
