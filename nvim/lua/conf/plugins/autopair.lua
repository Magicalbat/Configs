return {
  "altermo/ultimate-autopair.nvim",
  event = { "InsertEnter" },
  config = function()
    require("ultimate-autopair").setup({
      extensions = {
        default = {
          {
            "()",
            "[]",
            "{}",
            "<>",
            '""',
            "''",
            "``",
            "--",
            "**",
            "##",
          },
        },
      },
      pairs = {
        enable = true,
        override = function(pair)
          local open, close = pair[1], pair[2]
          local chars = { open, close }
          local cursor = vim.api.nvim_win_get_cursor(0)
          local line = vim.api.nvim_get_current_line()
          local row, col = cursor[1] - 1, cursor[2]
          local before = line:sub(1, col)
          local after = line:sub(col + 1)
          local escaped_open = vim.pesc(open)
          local escaped_close = vim.pesc(close)
          if before:match(escaped_open .. "$") and after:match("^" .. escaped_close) then
            vim.api.nvim_win_set_cursor(0, { row + 1, col + #open })
            return false
          end
        end,
      },
      quotes = {
        enable = true,
        pairs = { "'", '"', "`" },
        close_on_enter = true,
        escape = {
          enable = true,
          map = "<C-c>",
        },
      },
      brackets = {
        enable = true,
        close_on_enter = true,
        escape = {
          enable = true,
          map = "<C-c>",
        },
      },
      space_escape = {
        enable = true,
        map = "<C-k>",
      },
      newline = {
        enable = true,
        pairs = { "{", "[", "(" },
        comment = true,
        empty_undos = true,
      },
      indent = {
        enable = true,
        o_space = true,
        c_space = true,
      },
      fold = {
        enable = true,
        level = 1,
        callback = function(type)
          if type == "open" then
            vim.cmd.normal("zc")
          elseif type == "close" then
            vim.cmd.normal("zo")
          end
        end,
      },
    })
  end,
}
