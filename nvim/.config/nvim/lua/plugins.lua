return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'morhetz/gruvbox'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-commentary'
  use 'tpope/vim-unimpaired'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use 'vim-airline/vim-airline'
  use 'jiangmiao/auto-pairs'
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'ervandew/supertab'
  use 'maxmellon/vim-jsx-pretty' 
  use {
      'prettier/vim-prettier', 
      run = 'npm install' 
  } 
  use 'mattn/emmet-vim'
  use 'dag/vim-fish'
  use 'glepnir/lspsaga.nvim'
  use 'thosakwe/vim-flutter'
  use 'dart-lang/dart-vim-plugin'
  use 'airblade/vim-gitgutter'
  use 'reisub0/hot-reload.vim'
  use 'nelsyeung/twig.vim'
end)

