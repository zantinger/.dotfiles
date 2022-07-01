" Plugins
call plug#begin('~/.vim/plugged')
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'neovim/nvim-lspconfig'
" Plug 'glepnir/lspsaga.nvim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
Plug 'onsails/lspkind-nvim'

Plug 'mattn/emmet-vim'

" Plug 'simrat39/symbols-outline.nvim'

Plug 'sbdchd/neoformat'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'

Plug 'vim-airline/vim-airline'

Plug 'nelsyeung/twig.vim'
Plug 'thosakwe/vim-flutter'
Plug 'dart-lang/dart-vim-plugin'
Plug 'reisub0/hot-reload.vim'
Plug 'hkupty/iron.nvim'

Plug 'jiangmiao/auto-pairs'

Plug 'frenzyexists/aquarium-vim', { 'branch': 'develop' }
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'ThePrimeagen/harpoon'
" " Plug 'TaDaa/vimade'
call plug#end()

" command Exec set splitright | vnew | set filetype=sh | read !sh #

" autocmd vimenter * ++nested colorscheme gruvbox
" autocmd VimEnter * hi Normal guibg=NONE ctermbg=none
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
" highlight Cursor guifg=white guibg=black
" highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
let ayucolor="light"
let g:aquarium_style="light"
let g:gruvbox_invert_selection=0
colo gruvbox
let mapleader = " "


" Maps
"
" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fw <cmd>Telescope find_files<cr>
nnoremap <leader>fo <cmd>Telescope oldfiles<cr>
nnoremap <leader>fk <cmd>Telescope keymaps<cr>

" Lsp
nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vs :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>va :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vld :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>vg :lua vim.lsp.diagnostic.goto_next()<CR>

nnoremap <C-a> <M-q>


" leave insert mode
inoremap jk <esc>

" fast save file
nnoremap <leader>w :w<cr>

" navigation
nnoremap <C-j> 30j 
nnoremap <C-k> 30k 
nnoremap <leader>h <C-w><Left>
nnoremap <leader>j <C-w><Down>
nnoremap <leader>k <C-w><Up>
nnoremap <leader>l <C-w><Right>

" sizing
nnoremap <leader>m <C-w><Bar>
nnoremap <leader>n <C-w>=

" harpoon
nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <C-y> :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <C-h> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <C-t> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <C-n> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <C-s> :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader>tu :lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <leader>te :lua require("harpoon.term").gotoTerminal(2)<CR>
nnoremap <leader>cu :lua require("harpoon.term").sendCommand(1, 1)<CR>
nnoremap <leader>ce :lua require("harpoon.term").sendCommand(1, 2)<CR>

tnoremap <Esc> <C-\><C-n>

" emmet
let g:user_emmet_leader_key = '<leader><leader>'

set completeopt=menu,menuone,noselect
lua require('foobar')
