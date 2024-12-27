vim.keymap.set('n', "<C-n>", "<cmd>NvimTreeOpen<CR>")
vim.keymap.set('n', "<C-\\>", function()
  Snacks.terminal.toggle()
end,
{ desc = "Toggle Terminal" })
vim.api.nvim_set_keymap('n', '<leader>z', 'za', { noremap = true, silent = true })
vim.keymap.set("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})
vim.keymap.set('n', '<leader>d', "<cmd>TagbarToggle<CR")
vim.keymap.set('n', '<leader>f', "<cmd>Lazy load telescope.nvim<CR><cmd>Telescope find_files<CR>", { desc = "Search Files" } )
vim.keymap.set('n', '<leader>g', "<cmd>Lazy load telescope.nvim<CR><cmd>Telescope live_grep<CR>", { desc = "Grep through your Files" } )
vim.keymap.set('n', '<leader>r', "<cmd>Lazy load telescope.nvim<CR><cmd>Telescope oldfiles<CR>", { desc = "View History of Files Visited" } )


