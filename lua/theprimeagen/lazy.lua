local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  'lervag/vimtex',
  { "folke/neodev.nvim", opts = {} },
  {'junegunn/fzf', build = function()
      vim.fn['fzf#install']()
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.0",
    dependencies = { "nvim-lua/plenary.nvim", "IllustratedMan-code/telescope-conda.nvim" }
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- {
  --   "rose-pine/neovim",
  --   lazy = false,
  --   priority = 1000,
  --   name = "rose-pine",
  --   config = function()
  --     vim.cmd("colorscheme rose-pine")
  --   end
  -- },
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {
        icons = false,
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  "nvim-treesitter/nvim-treesitter",
  "nvim-treesitter/playground",
  "theprimeagen/harpoon",
  "theprimeagen/refactoring.nvim",
  "mbbill/undotree",
  "tpope/vim-fugitive",
  "nvim-treesitter/nvim-treesitter-context",
  {
    "VonHeikemen/lsp-zero.nvim",
    version = "v2.x",
    dependencies = {
      -- LSP Support
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      -- Autocompletion
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      -- Snippets
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    }
  },
  "folke/zen-mode.nvim",
  "github/copilot.vim",
  "eandrju/cellular-automaton.nvim",
  -- "laytan/cloak.nvim",
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" }
  },
  "mfussenegger/nvim-jdtls",
  "terrortylor/nvim-comment",
  -- "luk400/vim-jukit",
  "christoomey/vim-tmux-navigator",
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
  },
}

require("lazy").setup(plugins, {})
