local options = {
    backup = false,
    clipboard = "unnamedplus",
    cmdheight = 2,
    completeopt = { "menuone", "noselect" } ,
    conceallevel = 0,
    fileencoding = "utf-8",
    hlsearch = true,
    incsearch = true,
    ignorecase = true,
    ro = false,
    mouse = "a",
    pumheight = 10,
    showmode = false,
    showtabline = 2,
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    termguicolors = true,
    timeoutlen = 1000,
    undofile = true,
    updatetime = 300,
    writebackup = false,
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    cursorline = false,
    number = true,
    relativenumber = false,
    numberwidth = 4,
    signcolumn = "yes",
    wrap = false,
    scrolloff = 4,
    sidescrolloff = 4,
    guifont = "Cascadia_Mono:h10",
    --guifont = "monospace:h11",
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

vim.opt.shortmess:append "c"
