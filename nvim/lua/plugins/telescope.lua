return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "v0.2.0", -- Use stable release
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- Native fzf sorter for performance
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			-- Treesitter for syntax highlighting in previews
			"nvim-treesitter/nvim-treesitter",
		},
		keys = {
			-- File operations
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
			{ "<leader>fR", "<cmd>Telescope oldfiles only_cwd=true<cr>", desc = "Recent files (cwd)" },

			-- Search operations
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
			{ "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Grep string" },

			-- Navigation
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
			{ "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },

			-- Quick access (no leader)
			{ "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		},
		config = function()
			require("telescope").setup({
				defaults = {
					-- Use fzf-native for speed and proper fuzzy file support
					file_sorter = require("telescope.sorters").get_fuzzy_file,
					generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
					-- Better file finding
					find_files = {
						hidden = true,
						no_ignore = false,
						follow = true,
					},
					-- Better UI
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							preview_width = 0.55,
						},
					},
					-- Preview configuration - disable treesitter highlighting to avoid errors
					preview = {
						treesitter = {
							enable = false, -- Disable to prevent ft_to_lang errors
						},
					},
				},
			})
			-- Try to load fzf extension
			pcall(require("telescope").load_extension, "fzf")
		end,
	},
}
