return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope.nvim")

-- LSP and autocompletion
   use {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets'
    }
    -- Rust tools
    use 'simrat39/rust-tools.nvim'
    -- use("tzachar/cmp-tabnine", { run = "./install.sh" })
    use("onsails/lspkind-nvim")
    use("nvim-lua/lsp_extensions.nvim")
    use ({
    'nvimdev/lspsaga.nvim',
    after = 'nvim-lspconfig',
    config = function()
        require('lspsaga').setup({})
    end,
})

    use('sbdchd/neoformat')

    use('jiangmiao/auto-pairs')

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- use('vimwiki/vimwiki')

    --use {
    --  'sudormrfbin/cheatsheet.nvim',

     -- requires = {
     --   {'nvim-telescope/telescope.nvim'},
     --   {'nvim-lua/popup.nvim'},
     --   {'nvim-lua/plenary.nvim'},
     -- }
   -- }

    use("ThePrimeagen/harpoon")

    use("NeogitOrg/neogit")

    use("mattn/emmet-vim")

    use("tpope/vim-commentary")

    use("ellisonleao/gruvbox.nvim")

    -- use("gruvbox-community/gruvbox")
    use("folke/tokyonight.nvim")
    use({"catppuccin/nvim", as = "catppuccin" })

    use("kyazdani42/nvim-web-devicons")

    use("lumiliet/vim-twig")

    use("tpope/vim-dadbod")

    use("thosakwe/vim-flutter")
    use("dart-lang/dart-vim-plugin")
    use("reisub0/hot-reload.vim")
    -- use("natebosch/vim-lsc")
    -- use("natebosch/vim-lsc-dart")

    -- use("rafamadriz/friendly-snippets")
    use("Neevash/awesome-flutter-snippets")
    -- use("mfussenegger/nvim-dap")
    -- use("mfussenegger/nvim-dap-python")
        use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    -- use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    -- use("theHamsta/nvim-dap-virtual-text")
    -- use("nvim-telescope/telescope-dap.nvim")

    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- use {
    --     "Exafunction/codeium.nvim",
    --     requires = {
    --         "nvim-lua/plenary.nvim",
    --         "hrsh7th/nvim-cmp",
    --     },
    --     config = function()
    --         require("codeium").setup({
    --         })
    --     end
    -- }

    -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

    use 'APZelos/blamer.nvim'

    use 'folke/neodev.nvim'

    use 'ray-x/lsp_signature.nvim'

    use 'mustache/vim-mustache-handlebars'

    use { "kkharji/sqlite.lua" }

    -- use 'dense-analysis/ale'

    use {
      'ravitemer/mcphub.nvim',
      requires = {
        'nvim-lua/plenary.nvim', -- Required for async operations
      },
      -- run = 'npm install -g mcp-hub@latest', -- This command runs after installation/update
      config = function()
        require('mcphub').setup({
          port = 3000, -- You can choose any available port
          config = vim.fn.expand("~/.config/mcphub/servers.json"), -- Default config file location
        })
      end
    }
end)
