local Remap = require("zantinger.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<C-p>", ":Telescope")
nnoremap("<leader>ps", function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)
nnoremap("<C-p>", function()
    require('telescope.builtin').git_files()
end)
nnoremap("<Leader>pf", function()
    require('telescope.builtin').find_files()
end)

nnoremap("<leader>pw", function()
    require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end)
nnoremap("<leader>pb", function()
    require('telescope.builtin').buffers()
end)
nnoremap("<leader>vh", function()
    require('telescope.builtin').help_tags()
end)
nnoremap("<leader>pt", function()
    require('telescope.builtin').tags()
end)

-- TODO
-- nnoremap("<leader>vrc", function()
--     require('theprimeagen.telescope').search_dotfiles({ hidden = true })
-- end)
-- nnoremap("<leader>gc", function()
--     require('theprimeagen.telescope').git_branches()
-- end)
