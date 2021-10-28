local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local nvim_lsp = require('lspconfig')
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    --     -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    --     -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    formatting = {
  format = require("lspkind").cmp_format({with_text = true, menu = ({
      buffer = "[Buffer]",
      nvim_lsp = "[LSP]",
      luasnip = "[LuaSnip]",
      nvim_lua = "[Lua]",
      latex_symbols = "[Latex]",
    })}),
},

    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'nvim_lsp', keyword_length = 3},
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
      { name = 'buffer', keyword_length = 4 },
    })
  })


-- local coq = require "coq"

local servers = { "tsserver", "html","cssls", "vuels", "rust_analyzer", "intelephense" }

  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- require('lspconfig')[%YOUR_LSP_SERVER%].setup {
  --   capabilities = capabilities
  -- }


for _, lsp in ipairs(servers) do
  local filetypes = 0

  if lsp == "html" then
    filetypes = { "html", "twig" }
  -- elseif lsp == "intelephense" then
    -- filetypes = { "php", "twig" }
  else
    filetypes = nvim_lsp[lsp].filetypes
  end

  -- local capabilities = vim.lsp.protocol.make_client_capabilities()
  nvim_lsp[lsp].setup {
    -- coq.lsp_ensure_capabilities({
    --   filetypes = filetypes,
      capabilities = capabilities,
    -- })
    -- on_attach = require'completion'.on_attach
  }
end

  -- nvim_lsp["dartls"].setup (
    -- on_attach=require'completion'.on_attach
    -- coq.lsp_ensure_capabilities({})
  -- )
-- require'lspconfig'.tsserver.setup{coq.lsp_ensure_capabilities({})}

--require("coq_3p") {
--  { src = "figlet", short_name = "BIG" }
--}

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
-- vim.lsp.diagnostic.on_publish_diagnostics, {
--         -- virtual_text = false
--     }
-- )
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

