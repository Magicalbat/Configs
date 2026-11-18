-- Server configs --------------------------------------------------------------
-- nvim-lspconfig supplies defaults (cmd, filetypes, root markers); anything
-- below is merged on top. mason-lspconfig (set up in plugins.lua) auto-enables
-- every installed server, replacing the old `handlers` default.

vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--header-insertion=never",
    "--completion-style=detailed",
  },
})

local kind_icons = {
  Text = "", Method = "m", Function = "", Constructor = "", Field = "",
  Variable = "", Class = "", Interface = "", Module = "", Property = "",
  Unit = "", Value = "", Enum = "", Keyword = "", Snippet = "",
  Color = "", File = "", Reference = "", Folder = "", EnumMember = "",
  Constant = "", Struct = "", Event = "", Operator = "", TypeParameter = "",
}

local function convert(item)
  local kind = vim.lsp.protocol.CompletionItemKind[item.kind] or "Text"
  return { kind = kind_icons[kind] or kind }
end

vim.o.completeitemalign = "kind,abbr,menu"

-- Insert-mode popup mappings, same keys as before
local function pum(key, fallback)
  return function()
    return vim.fn.pumvisible() == 1 and key or fallback
  end
end
local expr = { expr = true }
vim.keymap.set("i", "<C-j>", pum("<C-n>", "<C-j>"), expr)
vim.keymap.set("i", "<C-k>", pum("<C-p>", "<C-k>"), expr)
vim.keymap.set("i", "<Tab>", pum("<C-n>", "<Tab>"), expr)
vim.keymap.set("i", "<S-Tab>", pum("<C-p>", "<S-Tab>"), expr)

-- Per-buffer setup when a server attaches --------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
  desc = "LSP actions",
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local function map(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, desc = desc })
    end

    map("K", vim.lsp.buf.hover, "Hover")
    map("<leader>k", vim.diagnostic.open_float, "Line diagnostics")
    map("gd", vim.lsp.buf.definition, "Definition")
    map("gD", vim.lsp.buf.declaration, "Declaration")
    map("gi", vim.lsp.buf.implementation, "Implementation")
    map("go", vim.lsp.buf.type_definition, "Type definition")
    map("gr", vim.lsp.buf.references, "References")
    map("gs", vim.lsp.buf.signature_help, "Signature help")
    map("<F2>", vim.lsp.buf.rename, "Rename")
    map("<F4>", vim.lsp.buf.code_action, "Code action")

    local letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_"
    if client and client:supports_method("textDocument/completion") then
      local provider = client.server_capabilities.completionProvider
      if provider then
        local seen, chars = {}, {}
        for _, c in ipairs(provider.triggerCharacters or {}) do
          seen[c] = true
          table.insert(chars, c)
        end
        for c in letters:gmatch(".") do
          if not seen[c] then table.insert(chars, c) end
        end
        provider.triggerCharacters = chars

        vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true, convert = convert })
      end
    end
  end,
})

vim.opt.completeopt = { "menu", "menuone", "noselect", "popup" }
