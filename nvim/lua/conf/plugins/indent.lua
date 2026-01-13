return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("ibl").setup({
      enabled = true,
      debounce = 100,
      indent = {
        char = "│",
        tab_char = "│",
        highlight = "IndentBlanklineIndent",
      },
      scope = {
        enabled = true,
        show_start = true,
        show_end = true,
        char = "▎",
        highlight = "IndentBlanklineScope",
      },
      exclude = {
        filetypes = {
          "dashboard",
          "lazy",
          "neogitstatus",
          "TelescopePrompt",
          "TelescopeResults",
          "help",
          "alpha",
          "terminal",
          "trouble",
          "startuptime",
          " Dresden ",
        },
        buftypes = {
          "terminal",
          "prompt",
          " fugitive ",
          " help ",
          " man ",
        },
      },
      scope_char = "▎",
      show_trailing_blankline_indent = false,
      show_current_context = false,
      show_current_context_start = false,
    })
  end,
}
