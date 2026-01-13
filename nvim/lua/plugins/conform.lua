return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				-- Lua
				lua = { "stylua" },

				-- Python (install via: pip install black isort)
				python = { "isort", "black", lsp_format = "fallback" },

				-- Rust
				rust = { "rustfmt", lsp_format = "fallback" },

				-- Go
				go = { "gofmt" },

				-- Web Development - JavaScript/TypeScript
				-- prettierd is faster, prettier is fallback
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },

				-- Web Development - Styles
				css = { "prettierd", "prettier", stop_after_first = true },
				scss = { "prettierd", "prettier", stop_after_first = true },
				less = { "prettierd", "prettier", stop_after_first = true },
				sass = { "prettierd", "prettier", stop_after_first = true },

				-- Web Development - Markup
				html = { "prettierd", "prettier", stop_after_first = true },
				htmldjango = { "prettierd", "prettier", stop_after_first = true },
				xml = { "prettierd", "prettier", stop_after_first = true },

				-- Web Development - Data formats
				json = { "prettierd", "prettier", stop_after_first = true },
				jsonc = { "prettierd", "prettier", stop_after_first = true },
				yaml = { "prettierd", "prettier", stop_after_first = true },
				yml = { "prettierd", "prettier", stop_after_first = true },

				-- Web Development - Other
				markdown = { "prettierd", "prettier", stop_after_first = true },
				md = { "prettierd", "prettier", stop_after_first = true },
				graphql = { "prettierd", "prettier", stop_after_first = true },
			},
			-- Prettier will automatically use .prettierrc, .prettierrc.json, or package.json
			-- from your project root. No need to configure args here.
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 2000, -- Increased timeout for prettier
			},
			-- Show notifications for errors
			notify_on_error = true,
		})

		vim.keymap.set({ "n", "v" }, "<leader>fm", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
