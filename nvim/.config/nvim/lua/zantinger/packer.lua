return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope.nvim")

    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")
    -- use("tzachar/cmp-tabnine", { run = "./install.sh" })
    use("onsails/lspkind-nvim")
    use("nvim-lua/lsp_extensions.nvim")
    use("glepnir/lspsaga.nvim")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")

    use('sbdchd/neoformat')

    use('jiangmiao/auto-pairs')

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use('vimwiki/vimwiki')

    use {
      'sudormrfbin/cheatsheet.nvim',

      requires = {
        {'nvim-telescope/telescope.nvim'},
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'},
      }
    }

    use("ThePrimeagen/harpoon")

    use("TimUntersberger/neogit")

    use("mattn/emmet-vim")

    use("tpope/vim-commentary")

    use("gruvbox-community/gruvbox")
    use("folke/tokyonight.nvim")
    use({"catppuccin/nvim", as = "catppuccin" })
    use({ 'rose-pine/neovim', as = 'rose-pine' })

    use("kyazdani42/nvim-web-devicons")

    use("lumiliet/vim-twig")

    use("tpope/vim-dadbod")

    use("thosakwe/vim-flutter")
    use("dart-lang/dart-vim-plugin")
    use("reisub0/hot-reload.vim")

    -- use("rafamadriz/friendly-snippets")
    use("Neevash/awesome-flutter-snippets")
    use("mfussenegger/nvim-dap")
    use("mfussenegger/nvim-dap-python")
        use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    -- use("theHamsta/nvim-dap-virtual-text")
    -- use("nvim-telescope/telescope-dap.nvim")

    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
end)
