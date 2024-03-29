local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

require "nvim-treesitter.install".compilers = { "clang" }
require 'nvim-treesitter.install'.prefer_git = false

configs.setup {
  ensure_installed = { "c", "cpp", "lua", "python", "html", "javascript", "css" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
		enable = true,
	},
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
}

-- Long story
-- https://github.com/Magicalbat/Animated-Presentation
vim.filetype.add({extension = { pres = "pres" }})
vim.treesitter.language.register("cpp", "pres")
