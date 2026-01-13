return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "tsx",
        "jsx",
        "json",
        "lua",
        "vue",
        "svelte",
        "astro",
        "graphql",
        "bash",
        "python",
        "markdown",
        "markdown_inline",
        "yaml",
        "toml",
        "dockerfile",
        "gitignore",
        "query",
        "vim",
        "vimdoc",
      },
      sync_install = false,
      auto_install = true,
      ignore_install = {},
      modules = {},
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = function(lang, buf)
          local max_filesize = 100 * 1024
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },
      indent = {
        enable = true,
        disable = { "python", "yaml" },
      },
      autotag = {
        enable = true,
        disable = { "markdown" },
      },
      context_commentstring = {
        enable = true,
        enable_quickfix = false,
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["ai"] = "@conditional.outer",
            ["ii"] = "@conditional.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]o"] = "@loop.outer",
            ["]a"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]O"] = "@loop.outer",
            ["]A"] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[o"] = "@loop.outer",
            ["[a"] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[O"] = "@loop.outer",
            ["[A"] = "@class.outer",
          },
        },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          node_decremental = "<S-CR>",
          scope_incremental = "<Tab>",
          scope_decremental = "<S-Tab>",
        },
      },
    })
  end,
}
