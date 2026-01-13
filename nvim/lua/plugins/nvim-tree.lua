return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  -- Keymaps are also defined in config/keymaps.lua for consistency, 
  -- but defining here ensures lazy loading works well.
  keys = {
    {"<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Explorer"},
    {"<leader>ef", "<cmd>NvimTreeFindFile<cr>", desc = "Find File in Explorer"}
  },
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      git = {
        enable = true,
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "H",
          info = "I",
          warning = "W",
          error = "E",
        },
      },
    }
  end,
}
