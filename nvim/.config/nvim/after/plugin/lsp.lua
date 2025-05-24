local Remap = require("zantinger.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

local lspconfig = require('lspconfig')

-- local sumneko_root_path = "/home/mpaulson/personal/sumneko"
-- local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

-- Setup nvim-cmp.
local cmp = require("cmp")
local luasnip = require'luasnip'

-- Load friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- Load custom snippets
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets/"})

-- local lspkind = require("lspkind")

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    snippet = {
    -- Specify how to expand a snippet
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
    mapping = {
         -- Navigate to the next item with <Tab>
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.jumpable() then
        luasnip.jump(1)
      else
        fallback()
      end
    end, {'i', 's'}),

    -- Navigate to the previous item with <S-Tab>
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, {'i', 's'}),

        -- Confirm the selection with <CR> (Enter)
    ['<CR>'] = cmp.mapping.confirm({ select = true }),

    -- Manually trigger completion menu with <C-Space>
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Abort completion with <C-e>
    ['<C-e>'] = cmp.mapping.abort(),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
  },
    sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
    }
})

-- Setup buffer-specific configurations for LSP signature help, etc.
cmp.setup.filetype('lua', {
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  }),
})

local function config(_config)
	return vim.tbl_deep_extend("force", {
		on_attach = function()
			nnoremap("gd", function() vim.lsp.buf.definition() end)
			nnoremap("K", function() vim.lsp.buf.hover() end)
			nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
			nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
			nnoremap("[d", function() vim.diagnostic.goto_next() end)
			nnoremap("]d", function() vim.diagnostic.goto_prev() end)
			nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end)
			nnoremap("<leader>vco", function() vim.lsp.buf.code_action({
                filter = function(code_action)
                    if not code_action or not code_action.data then
                        return false
                    end

                    local data = code_action.data.id
                    return string.sub(data, #data - 1, #data) == ":0"
                end,
                apply = true
            }) end)
			nnoremap("<leader>vrr", function() vim.lsp.buf.references() end)
			nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end)
			inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
		end,
	}, _config or {})
end

require'lspconfig'.marksman.setup(config())
require('lspconfig').volar.setup{
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
}
require("lspconfig").ts_ls.setup{
    init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
        languages = {"javascript", "typescript", "vue"},
      },
    },
  },
  filetypes = {
    "javascript",
    "typescript",
    "vue",
  },
}

require("lspconfig").jedi_language_server.setup(config())

require("lspconfig").html.setup({filetypes = {'html', 'ftl', 'twig', 'hbs', 'handlebars'}})


require("lspconfig").cssls.setup(config({
    -- settings = {
    -- css = {
    --   format = {
    --     indentSize = 4,
    --     tabSize = 4,
    --   }
    -- }
  -- }
}))
-- require("lspconfig").vuels.setup(config())
require("lspconfig").dartls.setup(config())
require("lspconfig").intelephense.setup({filetypes = {'php'}})
-- Setup rust-analyzer
require("lspconfig").rust_analyzer.setup(config({
    settings = {
        ["rust-analyzer"] = {}
    }
}))
-- Setup rust-tools.nvim
require('rust-tools').setup({})
-- require("lspconfig").sumneko_lua.setup(config({
--    settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = {'vim'},
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file("", true),
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
-- }))


-- require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
-- require("dapui").setup()
-- require("nvim-dap-virtual-text").setup()

-- require'lspconfig'.lua_ls.setup {
--   on_init = function(client)
--     local path = client.workspace_folders[1].name
--     if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
--       return
--     end

--     client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
--       runtime = {
--         -- Tell the language server which version of Lua you're using
--         -- (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT'
--       },
--       -- Make the server aware of Neovim runtime files
--       workspace = {
--         checkThirdParty = false,
--         library = {
--           vim.env.VIMRUNTIME
--           -- Depending on the usage, you might want to add additional paths here.
--           -- "${3rd}/luv/library"
--           -- "${3rd}/busted/library",
--         }
--         -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
--         -- library = vim.api.nvim_get_runtime_file("", true)
--       }
--     })
--   end,
--   settings = {
--     Lua = {}
--   }
-- }


-- Lua Language Server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, '?.lua')
table.insert(runtime_path, '?/init.lua')

-- Add additional paths for macOS
table.insert(runtime_path, '/usr/local/share/lua/5.1/?.lua')
table.insert(runtime_path, '/usr/local/share/lua/5.1/?/init.lua')

require'lspconfig'.lua_ls.setup ({
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT', -- LÖVR uses LuaJIT
        -- path = runtime_path, -- Set Lua runtime path for macOS
      },
      diagnostics = {
        globals = { 'vim', 'lovr' }, -- Recognize Neovim and LÖVR globals
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true, -- Neovim runtime files
          -- [vim.loop.cwd() .. '/lovr'] = true, -- Dynamically add local LÖVR folder
          ["/Users/michael_zant/projects/tutorials/lua/lovr"] = true, -- Point this to your local LÖVR source code directory
        },
        checkThirdParty = false, -- Disable third-party scanning
        -- Set maxPreload and preloadFileSize to limit excessive scanning
        maxPreload = 2000,  -- Limit the number of files to preload
        preloadFileSize = 500,  -- Limit file size in KB
        ignoreDir = { -- Exclude directories you don't want to scan
          ".git",
          "node_modules",
          "dist",
          "build",
          "tmp",
          "vendor"
        },
      },
      telemetry = {
        enable = false, -- Disable telemetry
      },
    },
  },
  -- capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()), -- Enable autocompletion
  -- on_attach = function(client, bufnr)
    -- Enable omnifunc for autocompletion
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Dynamically add the LÖVR folder to the workspace
    -- local lovr_path = vim.loop.cwd() .. '/lovr'
    -- if vim.fn.isdirectory(lovr_path) == 1 then
    --   client.config.settings.Lua.workspace.library[lovr_path] = true
    --   client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    --   print("LÖVR folder added to workspace: ", lovr_path) -- Debug message
    -- else
    --   print("LÖVR folder not found in project: ", lovr_path) -- Debug message
    -- end

    -- Signature help setup
    -- require('lsp_signature').on_attach({
    --   bind = true,
    --   floating_window = true,
    --   hint_enable = true,
    --   floating_window_above_cur_line = true,
    -- }, bufnr)
  -- end,
})

lspconfig.pylsp.setup {
  cmd = {"uv", "run", "pylsp"},
  root_dir = lspconfig.util.root_pattern('.git', '.venv'),
}
  -- cmd = {"pylsp"}, -- dummy placeholder
  -- root_dir = lspconfig.util.root_pattern('.git', 'setup.py', 'pyproject.toml', 'requirements.txt', '.venv'),
  -- on_new_config = function(new_config, _)
  --   new_config.cmd = {"nc", "localhost", "2088"}
  -- end,
