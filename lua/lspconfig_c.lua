local lspconfig = require "lspconfig"

-- List of LSP servers to configure
local servers = { "pyright", "ts_ls", "eslint", "rust_analyzer", "lua_ls" }

-- Loop through each LSP server and set up basic configurations
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = function(client, bufnr)
      -- LSP-related keybindings
      vim.keymap.set(
        "n",
        "gd",
        ":lua vim.lsp.buf.definition()<CR>",
        { silent = true, noremap = true, desc = "Go to Definition" }
      )
      vim.keymap.set(
        "n",
        "gr",
        ":lua vim.lsp.buf.references()<CR>",
        { silent = true, noremap = true, desc = "Find References" }
      )
      vim.keymap.set(
        "n",
        "K",
        ":lua vim.lsp.buf.hover()<CR>",
        { silent = true, noremap = true, desc = "Hover Documentation" }
      )

      -- Error checking: Show LSP diagnostics
      vim.keymap.set(
        "n",
        "<C-m>",
        ":lua vim.diagnostic.open_float()<CR>",
        { silent = true, noremap = true, desc = "Show Error Diagnostics" }
      )
    end,
    flags = {
      debounce_text_changes = 150, -- Optimizes LSP responsiveness
    },
  }
end

require('lspconfig').lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }, -- Recognize 'vim' as a global
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true), -- Make the LSP aware of Neovim runtime files
				checkThirdParty = false, -- Disable third-party library checks (optional)
			},
			telemetry = {
				enable = false, -- Disable telemetry (optional)
			},
		},
	},
})

