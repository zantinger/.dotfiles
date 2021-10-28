" Plugins
call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'neovim/nvim-lspconfig'
" Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
" Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
Plug 'onsails/lspkind-nvim'
"Plug 'L3MON4D3/LuaSnip'
"Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'mattn/emmet-vim'
Plug 'simrat39/symbols-outline.nvim'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'nelsyeung/twig.vim'
Plug 'thosakwe/vim-flutter'
Plug 'dart-lang/dart-vim-plugin'
Plug 'nvim-lua/completion-nvim'
Plug 'reisub0/hot-reload.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'glepnir/lspsaga.nvim'
" Plug 'frenzyexists/aquarium-vim', { 'branch': 'develop' }
" Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

autocmd vimenter * ++nested colorscheme gruvbox
autocmd VimEnter * hi Normal guibg=NONE ctermbg=none
" hi Normal guibg=NONE ctermbg=NONE

" Sets
syntax on
filetype plugin on
set encoding=utf8
" set guifont=DroidSansMono\ Nerd\ Font:h11
" set guifont=JetBrainsMono\ NF

set path+=**
set wildmode=longest,list,full
set wildmenu
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
set guicursor=
set relativenumber number
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
" set noshowmode
set signcolumn=yes
set isfname+=@-@
set cmdheight=1
set updatetime=50
set completeopt=menu,menuone,noselect
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
" let ayucolor="dark"
" colorscheme aquarium
" let g:aquarium_style="light"
let mapleader = " "

" Maps
"
" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fw <cmd>Telescope file_browser<cr>
nnoremap <leader>fo <cmd>Telescope oldfiles<cr>
nnoremap <leader>fk <cmd>Telescope keymaps<cr>

" Lsp
nnoremap <leader>ld :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>li :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>ls :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>lr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>ln :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>lh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>la :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>lld :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>lg :lua vim.lsp.diagnostic.goto_next()<CR>

nnoremap <C-a> <M-q>


" leave insert mode
inoremap jk <esc>

" fast save file
nnoremap <leader>w :w<cr>





set completeopt=menu,menuone,noselect
lua require('foobar')
