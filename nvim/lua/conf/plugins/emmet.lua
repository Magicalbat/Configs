return {
  "mattn/emmet-vim",
  ft = {
    "html",
    "css",
    "scss",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "svelte",
    "htmldjango",
    "php",
  },
  config = function()
    vim.g.user_emmet_mode = "i"
    vim.g.user_emmet_leader_key = "<C-y>"
    vim.g.user_emmet_settings = {
      javascriptreact = {
        extends = "jsx",
      },
      typescriptreact = {
        extends = "jsx",
      },
    }
    vim.g.user_emmet_install_global = 0
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "html",
        "css",
        "scss",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "svelte",
        "htmldjango",
        "php",
      },
      callback = function()
        vim.cmd("EmmetInstall")
      end,
    })
  end,
}
