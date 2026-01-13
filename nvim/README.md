# Neovim Web Development Configuration

A comprehensive Neovim configuration optimized for web development with TypeScript, React, Vue, and more.

## Features

- **Language Support**: TypeScript, JavaScript, React, Vue, Svelte, Astro, HTML, CSS, SCSS, Tailwind
- **LSP Support**: tsserver, html, cssls, tailwindcss, volar, eslint, jsonls
- **Fuzzy Finding**: Telescope with fzf integration
- **Git Integration**: Gitsigns for hunks, staging, and blame
- **File Explorer**: NvimTree with icons
- **Autocompletion**: nvim-cmp with LSP and snippets
- **Comments**: Comment.nvim for easy commenting
- **Status Line**: Lualine with git status
- **Buffer Management**: Bufferline with tabs
- **Keybinding Hints**: Which-key popup
- **Indentation**: Indent-blankline for visual guides
- **Emmet**: HTML/CSS abbreviations

## Keybindings

### General

| Keybinding | Action |
|------------|--------|
| `<Space>` | Leader key |
| `<C-h/j/k/l>` | Window navigation |
| `<C-d/u>` | Scroll with centering |
| `<C-Arrows>` | Resize windows |
| `<S-h/l>` | Previous/next buffer |
| `<leader>bd` | Close buffer |
| `<leader>e` | Toggle file explorer |
| `<leader>w` | Save file |
| `<leader>q` | Quit |

### Telescope

| Keybinding | Action |
|------------|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Git files |
| `<leader>fr` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |
| `<leader>fc` | Colorschemes |
| `<leader>fo` | Old files |

### LSP

| Keybinding | Action |
|------------|--------|
| `K` | Hover |
| `gd` | Definition |
| `gD` | Declaration |
| `gi` | Implementation |
| `gr` | References |
| `gs` | Signature help |
| `<F2>` | Rename |
| `<F4>` | Code action |
| `<leader>k` | Diagnostic float |

### Git

| Keybinding | Action |
|------------|--------|
| `<leader>ghs` | Stage hunk |
| `<leader>ghr` | Reset hunk |
| `<leader>ghp` | Preview hunk |
| `<leader>ghb` | Blame line |

### Comments

| Keybinding | Action |
|------------|--------|
| `<leader>/` | Toggle comment |

## Installation

1. Backup your existing nvim config
2. Copy this configuration to `~/.config/nvim/`
3. Open Neovim and run `:Lazy` to install plugins
4. Run `:Mason` to install LSP servers

## Requirements

- Neovim 0.9+
- Nerd Font (JetBrainsMono recommended)
- Git
- ripgrep (for Telescope live grep)
- Node.js (for LSP servers)

## Language Servers

The following LSP servers are automatically installed via Mason:

- `tsserver` - TypeScript/JavaScript
- `html` - HTML
- `cssls` - CSS
- `tailwindcss` - Tailwind CSS
- `eslint` - ESLint
- `volar` - Vue
- `jsonls` - JSON
- `lemminx` - XML
- `lua_ls` - Lua

Install with: `:MasonInstall tsserver html cssls tailwindcss eslint volar jsonls lemminx lua_ls`
