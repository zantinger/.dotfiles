local nvim_lsp = require('lspconfig')

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "tsserver", "html","cssls", "vuels" }

for _, lsp in ipairs(servers) do
  local filetypes = 0

  if lsp == "html" then
    filetypes = { "html", "twig" }
  else
    filetypes = nvim_lsp[lsp].filetypes
  end

  nvim_lsp[lsp].setup {
    filetypes,
    on_attach = require'completion'.on_attach
  }
end


