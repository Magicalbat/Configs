return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("Comment").setup({
      toggler = {
        line = "gcc",
        block = "gbc",
      },
      opleader = {
        line = "gc",
        block = "gb",
      },
      extra = {
        above = "gcO",
        below = "gco",
        eol = "gcA",
      },
      mappings = {
        basic = true,
        extra = true,
        extended = false,
      },
      pre_hook = function(ctx)
        local U = require("Comment.utils")
        local location = nil
        if ctx.ctype == U.ctype.block then
          location = require("Comment.lib").get_cursor_location()
        elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
          location = require("Comment.lib").get_selected_region()
        end
        if require("Comment.ft").is_extension(ctx.filetype) then
          location = nil
        end
        return location
      end,
      post_hook = nil,
      ignore = "^$",
    })

    vim.keymap.set("n", "<leader>/", function()
      require("Comment.api").toggle.linewise.current()
    end, { noremap = true, silent = true })
    vim.keymap.set("v", "<leader>/", function()
      require("Comment.api").toggle.linewise(vim.fn.visualmode())
    end, { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>?", function()
      require("Comment.api").toggle.blockwise.current()
    end, { noremap = true, silent = true })
  end,
}
