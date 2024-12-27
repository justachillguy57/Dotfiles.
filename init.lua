require 'mappings_c'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

require 'lazy' .setup { require "plugins" }

-- Options: 
local command = vim.cmd
vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.foldmethod = 'expr'  -- Use Treesitter-based folding expression
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'  -- Use Treesitter folding expression
vim.opt.foldlevelstart = 99  -- Open all folds on startup  
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
command( [[colorscheme tokyonight-night]] )
