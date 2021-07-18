#!/usr/bin/env fish

function install_stow
  if command -v stow > /dev/null
    echo "package stow is already installed..."
  else 
    echo "need to install stow..."
    sudo apt install stow
  end
end

function clean_nvim 
  echo "remove local nvim dir..."
  rm -rf "$HOME/.local/share/nvim/"
end

function clone_packer
  echo "clone packer..."
  mkdir -p "$HOME/.local/share/nvim/site/pack/packer/start"
  git clone https://github.com/wbthomason/packer.nvim\
 "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
end

function uninstall_npm_packages
  echo "uninstall global npm packages..."
  npm uninstall -g typescript typescript-language-server \
     vscode-langservers-extracted \
     vls
end

function install_npm_packages
  echo "install global npm packages..."
  npm install -g typescript typescript-language-server \
     vscode-langservers-extracted \
     vls
end

function create_symlinks
  stow -D nvim
  stow nvim
end

# run scripts
install_stow
clean_nvim
clone_packer
uninstall_npm_packages
install_npm_packages
create_symlinks
