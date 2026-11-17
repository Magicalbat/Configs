-- Run :TSUpdate after nvim-treesitter installs/updates.
-- Must be registered BEFORE vim.pack.add().
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local d = ev.data
    if d.spec.name == "nvim-treesitter" and (d.kind == "install" or d.kind == "update") then
      if not d.active then
        vim.cmd.packadd("nvim-treesitter")
      end
      pcall(vim.cmd, "TSUpdate")
    end
  end,
})

local function gh(repo)
  return "https://github.com/" .. repo
end

vim.pack.add({
  -- colorschemes
  gh("sainnhe/gruvbox-material"),
  gh("folke/tokyonight.nvim"),
  -- file tree
  gh("nvim-tree/nvim-tree.lua"),
  gh("nvim-tree/nvim-web-devicons"),
  -- fuzzy finder
  gh("nvim-lua/plenary.nvim"),
  gh("nvim-telescope/telescope.nvim"),
  -- editing
  gh("windwp/nvim-autopairs"),
  -- tooling
  gh("mason-org/mason.nvim"),
  gh("mason-org/mason-lspconfig.nvim"),
  gh("neovim/nvim-lspconfig"), -- only supplies default server definitions now
  -- treesitter: archived, so pin to main (its final state)
  { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },
})

-- Colorscheme ---------------------------------------------------------------
vim.g.gruvbox_material_background = "medium" -- soft | medium | hard
vim.g.gruvbox_material_foreground = "material" -- material | mix | original
vim.g.gruvbox_material_better_performance = 1

require("tokyonight").setup({ style = "night" })

vim.cmd.colorscheme("gruvbox-material") -- switch any time with :colorscheme tokyonight

-- nvim-tree -----------------------------------------------------------------
require("nvim-tree").setup({
  view = { width = 32 },
  renderer = { group_empty = true },
})
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file tree" })

-- Telescope -----------------------------------------------------------------
require("telescope").setup({
  defaults = {
    file_ignore_patterns = { "%.git[/\\]", "%.obj$", "%.o$", "%.exe$" },
  },
})
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep (needs ripgrep)" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })

-- Autopairs -----------------------------------------------------------------
require("nvim-autopairs").setup()

-- Mason ---------------------------------------------------------------------
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

-- mason-lspconfig v2 auto-enables installed servers via vim.lsp.enable()
-- (this replaces the old `handlers` / lspconfig[server].setup pattern).
-- Empty this list if you'd rather install everything by hand with :Mason.
require("mason-lspconfig").setup({
  ensure_installed = { "clangd", "pyright", "ruff", "lua_ls" },
  automatic_enable = true,
})
