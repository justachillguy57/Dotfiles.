return {
  {
    'onsails/lspkind-nvim',
    event = { "BufNewFile", "BufRead" },
  },
  {
    'williamboman/mason.nvim',
    config = function()
     	require 'mason_c'
    end 
  },

  -- LSP setup
  {
    'neovim/nvim-lspconfig',
    event = { "BufRead", "BufNewFile" },
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      local lspconfig = require('lspconfig')

      -- Pyright setup
      lspconfig.pyright.setup {}

      -- Lua language server setup with full configuration
      require 'lspconfig_c'


      -- Key mappings for LSP functions
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('user-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Define key mappings for LSP actions
          map('[d', vim.diagnostic.goto_prev, '[P]revious diagnostic')
          map(']d', vim.diagnostic.goto_next, '[N]ext diagnostic')
          map('K', vim.lsp.buf.hover, 'Hover Documentation')
          map('<leader>rn', vim.lsp.buf.rename, '[R]ename symbol')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          map('<C-k>', vim.lsp.buf.signature_help, 'Signature Help')
        end,
      })
    end,
    lazy = true,
  },

  -- nvim-cmp (completions)
  {
    'hrsh7th/nvim-cmp',
    event = { "BufRead", "BufNewFile" },
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
    },
    config = function()
      local cmp = require 'cmp'
      local lspkind = require('lspkind')

      cmp.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          format = lspkind.cmp_format({ mode = 'symbol_text', maxwidth = 50 }),
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-k>'] = cmp.mapping.select_prev_item(),
          ['<C-j>'] = cmp.mapping.select_next_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm { select = true },
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        },
      }
    end,
    lazy = true,
  },

  -- nvzone plugins
  {
    'nvzone/volt',
    lazy = true,
  },
  {
    'nvzone/menu',
    lazy = true,
  },
  {
    'nvzone/minty',
    lazy = true,
  },

  -- Treesitter setup
  {
    'nvim-treesitter/nvim-treesitter',
    event = { "BufRead", "BufNewFile" },
    lazy = true,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
    },
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'bash',
          'css',
          'html',
          'javascript',
          'lua',
          'python',
          'typescript',
        },
        highlight = { enable = true },
        indent = { enable = true },
        fold = { enable = true },
      }
    end,
  },

  -- Telescope setup
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files<CR>')
      vim.keymap.set('n', '<leader>g', '<cmd>Telescope live_grep<CR>')
      vim.keymap.set('n', '<leader>c', '<cmd>Telescope commands<CR>')
    end,
    lazy = true,
  },

  -- Tagbar
  {
    'preservim/tagbar',
    cmd = "TagbarToggle",
    lazy = true,
  },

  -- nvim-tree setup
  {
    'nvim-tree/nvim-tree.lua',
    cmd = "NvimTreeOpen",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("config.tree")
    end,
  },

  -- noice.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
    }
  },
  { "nvim-lua/plenary.nvim", lazy = true },
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- TokyoNight theme
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    lazy = false,
    opts = {},
  },

  -- snacks.nvim
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      dashboard = { enable = true, example = "compact_files" },
      indent = {
        enabled = true,  -- enable indent guides
        char = "│",
        only_scope = false, -- only show indent guides of the scope
        only_current = false, -- only show indent guides in the current window
        hl = "SnacksIndent",  -- highlight groups for indent guide
      },
      notifier = { enabled = true },
      animate = { enabled = true },
      terminal = { enabled = true },
      input = { enabled = true },
    },
  },

  -- nvim-autopairs
  {
    "windwp/nvim-autopairs",
    event = { "BufRead", "BufNewFile" },
    config = true,
  },

  -- lualine.nvim
  {
    "nvim-lualine/lualine.nvim",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require 'statusbar'
    end,
  }
}


