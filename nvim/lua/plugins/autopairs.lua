return {
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
}
