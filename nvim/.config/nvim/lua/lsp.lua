local nvim_lsp = require('lspconfig')

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = {  "jedi_language_server", "tsserver", "html","cssls", "vuels", "rust_analyzer", "dartls", "intelephense" }

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true


for _, lsp in ipairs(servers) do
  local filetypes = 0

  if lsp == "html" then
    filetypes = { "html", "twig" }
  elseif lsp == "intelephense" then
    filetypes = { "php", "twig" }
  else
    filetypes = nvim_lsp[lsp].filetypes
  end

  nvim_lsp[lsp].setup {
    filetypes = filetypes,
    capabilities = capabilities,
    on_attach = require'completion'.on_attach
  }
end


local saga = require 'lspsaga'
saga.init_lsp_saga ()

nvim_lsp.rls.setup {
  settings = {
    rust = {
      unstable_features = true,
      build_on_save = false,
      all_features = true,
    },
  },
  filetypes = { "rust", "rs" }
}

-- nvim_lsp.jedi_language_server.setup{}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)


