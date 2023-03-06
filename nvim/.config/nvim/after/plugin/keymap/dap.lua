local Remap = require("zantinger.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

local silent = { silent = true }

nnoremap("<C-h>", function() require("harpoon.ui").nav_file(1) end, silent)

nnoremap("<leader><leader>db", function() require"dap".toggle_breakpoint() end)
nnoremap("<leader><leader>dc", function() require"dap".continue() end)
nnoremap("<leader><leader>do", function() require"dapui".setup() end)
nnoremap("<leader>d<UP>", function() require"dap".step_out() end)
nnoremap("<leader>d<Down>", function() require"dap".step_into() end)
nnoremap("<leader>d<Right>", function() require"dap".step_over() end)
