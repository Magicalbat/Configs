# Configs

A repository to store my config files.

## Neovim
I set up neovim based on a modern configuration structure, enhanced with features from my backup configuration.

## Key Mappings

Leader key: **`<Space>`**

### 🎯 General Keymaps

| Key | Description |
|-----|-------------|
| `<Esc>` | Clear search highlights |
| `<C-h/j/k/l>` | Move to window (left/down/up/right) |
| `<C-Left/Right/Up/Down>` | Resize window (hold Ctrl + Arrow keys) |
| `<C-s>` | Save file |
| `<leader>q` | Quit all |
| `U` | Redo |
| `<leader>p` | Paste without losing register |
| `<leader>y` / `<leader>Y` | Yank to system clipboard |
| `J` / `K` (Visual) | Move selected text down/up |

### 📦 Lazy.nvim Plugin Manager

| Key | Command | Description |
|-----|---------|-------------|
| `<leader>ll` | `:Lazy` | Open Lazy menu |
| `<leader>ls` | `:Lazy sync` | Sync plugins |
| `<leader>lu` | `:Lazy update` | Update plugins |
| `<leader>li` | `:Lazy install` | Install plugins |
| `<leader>lc` | `:Lazy check` | Check plugin health |
| `<leader>lx` | `:Lazy clean` | Remove unused plugins |

### 🧱 Mason (Package Manager)

| Key | Command | Description |
|-----|---------|-------------|
| `<leader>M` | `:Mason` | Open Mason menu |

### 🔭 Telescope (Fuzzy Finder)

| Key | Command | Description |
|-----|---------|-------------|
| `<leader>ff` | `:Telescope find_files` | Find files |
| `<C-p>` | `:Telescope find_files` | Find files (quick access) |
| `<leader>fr` | `:Telescope oldfiles` | Recent files |
| `<leader>fR` | `:Telescope oldfiles` | Recent files (cwd) |
| `<leader>fg` | `:Telescope live_grep` | Live grep search |
| `<leader>fs` | `:Telescope grep_string` | Grep string under cursor |
| `<leader>fb` | `:Telescope buffers` | Find buffers |
| `<leader>fh` | `:Telescope help_tags` | Help tags |
| `<leader>fd` | `:Telescope diagnostics` | Diagnostics |

### 📂 Nvim-tree (File Explorer)

| Key | Command | Description |
|-----|---------|-------------|
| `<leader>e` | `:NvimTreeToggle` | Toggle file explorer |
| `<leader>ef` | `:NvimTreeFindFile` | Find current file in explorer |

### 📋 Bufferline (Buffer Navigation)

| Key | Description |
|-----|-------------|
| `<S-h>` or `[b` | Navigate to previous buffer |
| `<S-l>` or `]b` | Navigate to next buffer |
| `<leader>bp` | Toggle pin current buffer |
| `<leader>bP` | Delete all non-pinned buffers |
| `<leader>bP` | Delete all non-pinned buffers |
| `<leader>bo` | Close all other buffers |
| `<leader>br` | Close all buffers to the right |
| `<leader>bl` | Close all buffers to the left |

### 🧠 LSP & Code Navigation

| Key | Description |
|-----|-------------|
| `K` | Show hover documentation |
| `<leader>gd` | Go to definition |
| `<leader>gr` | Find references |
| `<leader>ca` | Code action |
| `<leader>d` | Show diagnostics float |
| `[d` / `]d` | Previous / Next diagnostic |

### 🔧 Formatting (Conform)

| Key | Description |
|-----|-------------|
| `<leader>fm` | Format file or range |

