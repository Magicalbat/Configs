return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.setup({
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = false,
          suggestions = 20,
        },
        presets = {
          operators = false,
          motions = false,
          text_objects = false,
          windows = false,
          nav = false,
          z = false,
          g = false,
        },
      },
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
      },
      window = {
        border = "none",
        position = "bottom",
        margin = { 1, 0, 1, 0 },
        padding = { 2, 2, 2, 2 },
        winblend = 0,
        zindex = 1000,
      },
      layout = {
        height = { min = 1, max = 10 },
        width = { min = 1, max = 30 },
        spacing = 3,
        align = "left",
      },
      ignore_missing = false,
      hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
      show_help = true,
      show_keys = true,
      triggers = "auto",
      triggers_blacklist = {
        i = { "j", "k" },
        v = { "j", "k" },
      },
    })

    wk.register({
      mode = { "n", "v" },
      ["<leader>"] = {
        name = "leader",
        f = { name = "telescope" },
        g = { name = "git" },
        h = { name = " LSP" },
        l = { name = "lsp" },
        c = { name = "code" },
        d = { name = "debug" },
        t = { name = "terminal" },
        w = { name = "windows" },
        b = { name = "buffers" },
        p = { name = "projects" },
        r = { name = "refactor" },
        s = { name = "search" },
        x = { name = "diagnostics" },
      },
      g = {
        name = "git",
        c = { "<cmd>Telescope git_commits<CR>", "commits" },
        C = { "<cmd>Telescope git_bcommits<CR>", "buffer commits" },
        s = { "<cmd>Telescope git_status<CR>", "status" },
        b = { "<cmd>Telescope git_branches<CR>", "branches" },
      },
      ["]"] = { name = "next" },
      ["["] = { name = "prev" },
    })
  end,
}
