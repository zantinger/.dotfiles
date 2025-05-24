local Remap = require("zantinger.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local tnoremap = Remap.tnoremap
local nmap = Remap.nmap

-- leave insert mode
inoremap('jk', '<ESC>')

-- fast source lua file
nnoremap('<Leader><Enter>', ':luafile %<CR>')

-- fast save file
nnoremap('<Leader>w', ':w<CR>')

nnoremap("<leader>pv", ":Explore<CR>")
nnoremap("<leader>u", ":UndotreeShow<CR>")


-- nnoremap("Y", "yg$")
-- nnoremap("n", "nzzzv")
-- nnoremap("N", "Nzzzv")
-- nnoremap("J", "mzJ`z")
-- nnoremap("<C-d>", "<C-d>zz")
-- nnoremap("<C-u>", "<C-u>zz")

nnoremap("<leader>f", ':Neoformat')

-- nnoremap("<C-k>", "<cmd>cnext<CR>zz")
-- nnoremap("<C-j>", "<cmd>cprev<CR>zz")
-- nnoremap("<leader>k", "<cmd>lnext<CR>zz")
-- nnoremap("<leader>j", "<cmd>lprev<CR>zz")

nnoremap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
nnoremap("<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

nnoremap("<leader>t", "<cmd>Lspsaga term_toggle<CR>", { silent = true })
tnoremap("<leader>t", "<cmd>Lspsaga term_toggle<CR>", { silent = true })

