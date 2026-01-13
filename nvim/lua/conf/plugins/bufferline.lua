return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim",
  },
  config = function()
    require("bufferline").setup({
      options = {
        numbers = "none",
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        indicator = {
          style = "icon",
          icon = "▎",
        },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        enforce_regular_tabs = true,
        auto_hide = false,
        always_show_bufferline = true,
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
        sort_by = "id",
      },
    })

    vim.keymap.set("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>0", ":BufferLineGoToBuffer -1<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
  end,
}
