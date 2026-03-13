local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-frappe")
    end,
  },

  {
    "folke/tokyonight.nvim",
    priority = 1000,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>" },
    },
  },

  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
    ft = "markdown",
  },

  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>do", "<cmd>DiffviewOpen<CR>", desc = "Diffview open" },
      { "<leader>dc", "<cmd>DiffviewClose<CR>", desc = "Diffview close" },
      { "<leader>dh", "<cmd>DiffviewFileHistory %<CR>", desc = "File history" },
    },
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
  },

  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = function()
      require("git-conflict").setup({
        default_mappings = true, -- co=ours, ct=theirs, cb=both, c0=none, ]x/[x=nav
      })
    end,
  },
})
