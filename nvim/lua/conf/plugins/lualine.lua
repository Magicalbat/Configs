return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local colors = {
      bg = "#1e222a",
      bg_dark = "#16161e",
      bg_light = "#2a2e3a",
      fg = "#c0caf5",
      fg_dark = "#565f89",
      fg_light = "#ffffff",
      yellow = "#e0af68",
      cyan = "#7dcfff",
      darkblue = "#7aa2f7",
      green = "#9ece6a",
      orange = "#ff9e64",
      magenta = "#bb9af7",
      pink = "#f7768e",
      red = "#f7768e",
      blue = "#7aa2f7",
      gray1 = "#24283b",
      gray2 = "#414868",
      gray3 = "#565f89",
      gray4 = "#7982a9",
      gray5 = "#9aa5ce",
      gray6 = "#c0caf5",
    }

    local theme = {
      normal = {
        a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
        b = { fg = colors.fg, bg = colors.gray2 },
        c = { fg = colors.fg, bg = colors.bg_dark },
        x = { fg = colors.fg, bg = colors.bg },
        y = { fg = colors.fg, bg = colors.gray2 },
        z = { fg = colors.bg, bg = colors.cyan },
      },
      insert = {
        a = { fg = colors.bg, bg = colors.green, gui = "bold" },
        b = { fg = colors.fg, bg = colors.gray2 },
        c = { fg = colors.fg, bg = colors.bg_dark },
        x = { fg = colors.fg, bg = colors.bg },
        y = { fg = colors.fg, bg = colors.gray2 },
        z = { fg = colors.bg, bg = colors.green },
      },
      visual = {
        a = { fg = colors.bg, bg = colors.magenta, gui = "bold" },
        b = { fg = colors.fg, bg = colors.gray2 },
        c = { fg = colors.fg, bg = colors.bg_dark },
        x = { fg = colors.fg, bg = colors.bg },
        y = { fg = colors.fg, bg = colors.gray2 },
        z = { fg = colors.bg, bg = colors.magenta },
      },
      replace = {
        a = { fg = colors.bg, bg = colors.red, gui = "bold" },
        b = { fg = colors.fg, bg = colors.gray2 },
        c = { fg = colors.fg, bg = colors.bg_dark },
        x = { fg = colors.fg, bg = colors.bg },
        y = { fg = colors.fg, bg = colors.gray2 },
        z = { fg = colors.bg, bg = colors.red },
      },
      command = {
        a = { fg = colors.bg, bg = colors.orange, gui = "bold" },
        b = { fg = colors.fg, bg = colors.gray2 },
        c = { fg = colors.fg, bg = colors.bg_dark },
        x = { fg = colors.fg, bg = colors.bg },
        y = { fg = colors.fg, bg = colors.gray2 },
        z = { fg = colors.bg, bg = colors.orange },
      },
      inactive = {
        a = { fg = colors.fg_dark, bg = colors.gray1 },
        b = { fg = colors.fg_dark, bg = colors.gray1 },
        c = { fg = colors.fg_dark, bg = colors.gray1 },
        x = { fg = colors.fg_dark, bg = colors.gray1 },
        y = { fg = colors.fg_dark, bg = colors.gray1 },
        z = { fg = colors.fg_dark, bg = colors.gray1 },
      },
    }

    local function diff_source()
      local gitsigns = vim.b.gitsigns_status_dict
      if gitsigns then
        local added = gitsigns.added
        local changed = gitsigns.changed
        local removed = gitsigns.removed
        local status = ""
        if added and added > 0 then
          status = status .. "+" .. added .. " "
        end
        if changed and changed > 0 then
          status = status .. "~" .. changed .. " "
        end
        if removed and removed > 0 then
          status = status .. "-" .. removed
        end
        return status ~= "" and status or nil
      end
      return nil
    end

    local function lsp_client_names()
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      if #clients == 0 then
        return ""
      end
      local names = {}
      for _, client in ipairs(clients) do
        table.insert(names, client.name)
      end
      return table.concat(names, ", ")
    end

    local function filetype()
      local ft = vim.bo.filetype
      if ft == "" then
        return "no ft"
      end
      return ft
    end

    require("lualine").setup({
      options = {
        theme = theme,
        section_separators = { "", "" },
        component_separators = { "", "" },
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "lazy" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", diff_source },
        lualine_c = { "filename", "lsp_client_names" },
        lualine_x = { "diagnostics", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {},
    })
  end,
}
