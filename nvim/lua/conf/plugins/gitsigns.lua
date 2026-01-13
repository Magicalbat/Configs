return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "▒" },
        topdelete = { text = "▒" },
        changedelete = { text = "│" },
        untracked = { text = "│" },
      },
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        map("n", "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end, { expr = true })

        map("n", "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, { expr = true })

        map({ "n", "v" }, "<leader>ghs", gs.stage_hunk, { desc = "stage hunk" })
        map({ "n", "v" }, "<leader>ghr", gs.reset_hunk, { desc = "reset hunk" })
        map("n", "<leader>ghS", gs.stage_buffer, { desc = "stage buffer" })
        map("n", "<leader>ghu", gs.undo_stage_hunk, { desc = "undo stage hunk" })
        map("n", "<leader>ghR", gs.reset_buffer, { desc = "reset buffer" })
        map("n", "<leader>ghp", gs.preview_hunk, { desc = "preview hunk" })
        map("n", "<leader>ghb", gs.blame_line, { desc = "blame line" })
        map({ "n", "o" }, "ih", gs.select_hunk, { desc = "select hunk" })
        map({ "n", "x" }, "ih", gs.select_hunk, { desc = "select hunk" })
      end,
    })
  end,
}
