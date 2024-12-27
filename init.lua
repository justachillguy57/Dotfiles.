-- Set <leader> key to " "
vim.g.mapleader = " "

-- Basic settings
vim.opt.number = true           -- Enable line numbers
vim.opt.relativenumber = false   -- Enable relative line numbers
vim.opt.termguicolors = true    -- Enable true colors

-- Install lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Configure lazy.nvim
require("lazy").setup({
  -- Tokyonight colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      telescope.setup({})
      -- Map <C-f> globally to Telescope find_files
      vim.keymap.set("n", "<C-f>", "<cmd>Telescope find_files<CR>", { desc = "Find Files with Telescope" })
      vim.keymap.set("i", "<C-f>", "<cmd>Telescope find_files<CR>", { desc = "Find Files with Telescope" })
    end,
  },

  -- Neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- Icons
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        window = {
          width = 25, -- Set the width of the Neo-tree window (narrower)
        },
      })
    end,
  },

  -- Web Devicons
  { "nvim-tree/nvim-web-devicons" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "cpp", "c", "lua" }, -- Add languages here
        highlight = { enable = true },           -- Enable syntax highlighting
      })
    end,
  },
})


vim.keymap.set("n", "<C-n>", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

