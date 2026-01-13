return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			close_command = function(n)
				vim.cmd("bdelete! " .. n)
			end,
			right_mouse_command = function(n)
				vim.cmd("bdelete! " .. n)
			end,
			diagnostics = "nvim_lsp",
			always_show_bufferline = false,
			diagnostics_indicator = function(count, level)
				local icon = level:match("error") and " " or " "
				return " " .. icon .. count
			end,
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					highlight = "Directory",
					text_align = "left",
				},
			},
			hover = {
				enabled = true,
				delay = 200,
				reveal = { "close" },
			},
			separator_style = "slant",
		},
	},
}
