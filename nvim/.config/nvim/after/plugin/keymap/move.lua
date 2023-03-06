local Remap = require("zantinger.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

nnoremap('<leader>h', '<C-w><Left>')
nnoremap('<leader>j', '<C-w><Down>')
nnoremap('<leader>k', '<C-w><Up>')
nnoremap('<leader>l', '<C-w><Right>')
nnoremap('<C-d>', '<C-d>zz')
nnoremap('<C-j>', '<C-d>zz')
nnoremap('<C-k>', '<C-u>zz')
