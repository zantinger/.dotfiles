local nvim_lsp = require('lspconfig')
local coq = require "coq"

local servers = { "tsserver", "html","cssls", "vuels", "rust_analyzer", "intelephense" }

for _, lsp in ipairs(servers) do
  local filetypes = 0

  if lsp == "html" then
    filetypes = { "html", "twig" }
  -- elseif lsp == "intelephense" then
    -- filetypes = { "php", "twig" }
  else
    filetypes = nvim_lsp[lsp].filetypes
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  nvim_lsp[lsp].setup {
    coq.lsp_ensure_capabilities({
      filetypes = filetypes,
      capabilities = capabilities,
    })
    -- on_attach = require'completion'.on_attach
  }
end

  nvim_lsp["dartls"].setup (
    -- on_attach=require'completion'.on_attach
    coq.lsp_ensure_capabilities({})
  )
-- require'lspconfig'.tsserver.setup{coq.lsp_ensure_capabilities({})}

--require("coq_3p") {
--  { src = "figlet", short_name = "BIG" }
--}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)
require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "send_selected_to_qflist"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

