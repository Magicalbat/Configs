-- ============================================================================
-- LSP Configuration - Using Neovim 0.11+ native vim.lsp.config API
-- ============================================================================

return {
	{
		"neovim/nvim-lspconfig", -- Still required!
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			-- Setup Mason first
			require("mason").setup()
			require("mason-lspconfig").setup({
				-- LSP servers only (prettier is a formatter, not an LSP)
				ensure_installed = {
					"rust_analyzer",
					"pyright",
					"lua_ls",
					"tsserver", -- TypeScript/JavaScript LSP server
				},
			})

			-- Configure servers using NEW API
			-- Lua LSP
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = {
								"vim",
								"require",
							},
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})

			-- Rust LSP
			vim.lsp.config("rust_analyzer", {})

			-- Python LSP
			vim.lsp.config("pyright", {})

			-- TypeScript/JavaScript LSP
			vim.lsp.config("tsserver", {
				settings = {
					typescript = {
						inlayHints = {
							enabled = true,
						},
					},
					javascript = {
						inlayHints = {
							enabled = true,
						},
					},
				},
			})

			-- Enable servers
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("rust_analyzer")
			vim.lsp.enable("pyright")
			vim.lsp.enable("tsserver")

			-- Keymaps
			vim.keymap.set("n", "<C-i>", vim.lsp.buf.definition, { desc = "Goto definition" })
			vim.keymap.set("n", "<S-l>", vim.lsp.buf.hover, { desc = "Hover" })
		end,
	},
}
