-- vim.opt.guicursor = ""
vim.opt.guicursor='n-v-c:block-Cursor,i:ver100-iCursor'

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.errorbells = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")

--vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

-- Theme
vim.o.background = "dark" -- "light"
vim.cmd([[colorscheme gruvbox]])

vim.g.neoformat_basic_format_align = 1
vim.g.neoformat_basic_format_retab = 1
vim.g.neoformat_basic_format_trim = 1
vim.g.neoformat_run_all_formatters = 1

-- Vimwiki
vim.g.vimwiki_list = {
  { path = '~/Google Drive/Meine Ablage/vimwikitest/', 
  -- syntax = 'markdown', 
  -- ext = 'md',
  path_html = '~/Google Drive/Meine Ablage/vimwikitest/html/' 
},
  { path = '~/my_docs/', name = 'mydocs', ext = '.mdox' }
}
vim.o.compatible = false
vim.cmd('filetype plugin on')
vim.cmd('syntax enable')


vim.opt.conceallevel = 1

vim.api.nvim_command('set tags+=tags')

vim.api.nvim_create_user_command(
  'Exec',
  function()
    vim.opt.splitright = true
    vim.cmd('vnew')
    vim.bo.filetype = 'sh'
    vim.cmd('read !sh #')
  end,
  {}
)
