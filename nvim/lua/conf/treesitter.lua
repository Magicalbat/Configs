-- Parser installation uses nvim-treesitter's `main` branch (archived, but works on 0.12).
-- Building parsers needs a C compiler and the tree-sitter CLI on PATH
-- (`:MasonInstall tree-sitter-cli` covers the CLI). If the CLI is missing,
-- this is skipped and Neovim's bundled parsers (c, lua, vim, vimdoc,
-- markdown, query) still work.
local ok, ts = pcall(require, "nvim-treesitter")
if ok and vim.fn.executable("tree-sitter") == 1 then
  ts.install({ "c", "python", "lua", "vim", "vimdoc", "markdown", "markdown_inline", "query" })
end

-- Start highlighting for any filetype that has a parser; silently skip the rest.
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("user_ts_start", { clear = true }),
  callback = function(ev)
    pcall(vim.treesitter.start, ev.buf)
  end,
})
