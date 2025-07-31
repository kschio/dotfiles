# Minimal neovim config

## Prerequisites

- Neovim >= 0.11.0
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [Nerd Font](https://www.nerdfonts.com/)

## Features

### Key Plugins

- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)**: Fuzzy finder for files, buffers, and more.
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Enhanced syntax highlighting and code navigation.
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)**: Easy configuration for built-in LSP support.
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)**: Fast and customizable statusline.
- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)**: Git integration with signs and hunk actions.
- **[trouble.nvim](https://github.com/folke/trouble.nvim)**: A pretty diagnostics list.
- **[harpoon](https://github.com/ThePrimeagen/harpoon)**: Quick file navigation.
- **[zen-mode.nvim](https://github.com/folke/zen-mode.nvim)**: Distraction-free coding.
- **[flash.nvim](https://github.com/folke/flash.nvim)**: Enhanced motion and search.
- **[conform.nvim](https://github.com/stevearc/conform.nvim)**: Fast and flexible formatter.
- **[supermaven-nvim](https://github.com/supermaven-inc/supermaven-nvim)**: AI completion and chat.
- **[blink.cmp](https://github.com/Saghen/blink.cmp)**: Modern completion engine.
- **[mason.nvim](https://github.com/williamboman/mason.nvim)**: LSP/DAP/linter/formatter installer.
- **[neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)**: Modern file explorer with icons and git status.
- **[lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)**: LazyGit integration.
- **[nvim-dap](https://github.com/mfussenegger/nvim-dap)**: Debug Adapter Protocol for debugging.
- **[lspsaga.nvim](https://github.com/nvimdev/lspsaga.nvim)**: Enhanced LSP UI.

### Keybindings

The `<Leader>` key is set to **`space`** in this configuration.

#### File Navigation

- **`<leader>ff`**: Find files using telescope
- **`<leader>fg`**: Find git files
- **`<leader>fb`**: Find buffers
- **`<leader>fr`**: Recent files
- **`<leader><space>`**: Find buffers (quick access)
- **`<leader>e`**: Toggle file explorer (neo-tree)

#### Search

- **`<leader>fs`** / **`<leader>sg`**: Live grep
- **`<leader>sw`**: Search word under cursor
- **`<leader>sB`**: Grep in all open buffers
- **`<leader>sk`**: Search keymaps
- **`<leader>sh`**: Search help tags
- **`<leader>sd`**: Search diagnostics
- **`<leader>s:`**: Command history
- **`<leader>sm`**: Search marks
- **`<leader>s"`**: Search registers

#### Git Integration

- **`<leader>gg`**: Open LazyGit
- **`<leader>gs`**: Git status with telescope
- **`<leader>gb`**: Git branches with telescope
- **`<leader>gc`**: Git commits log
- **`<leader>hn/hp`**: Next/Previous git hunk
- **`<leader>hs`**: Stage hunk
- **`<leader>hr`**: Reset hunk
- **`<leader>hb`**: Git blame
- **`<leader>hB`**: Toggle line blame
- **`<leader>hd`**: Diff this file
- **`<leader>hu`**: Undo stage hunk

#### LSP Features

- **`<leader>ca`**: Code actions
- **`<leader>rn`**: Rename symbol
- **`gr`**: Show references (telescope)
- **`gd`**: Go to definition (telescope)
- **`gD`**: Go to declaration
- **`gi`**: Show implementations
- **`gy`**: Go to type definition
- **`K`**: Show hover documentation (lspsaga)
- **`[d` / `]d`**: Previous/Next diagnostic
- **`<leader>d`**: Show line diagnostics
- **`<leader>D`**: Show buffer diagnostics
- **`<leader>rs`**: Restart LSP
- **`<leader>fl`**: LSP document symbols

#### Debugging

- **`<leader>db`**: Toggle breakpoint
- **`<leader>dc`**: Start/Continue debugging
- **`<F8>`**: Start/Continue debugging
- **`<F9>`**: Step into
- **`<F10>`**: Step over
- **`<F11>`**: Step out
- **`<leader>de`**: Evaluate variable under cursor
- **`<leader>dt`**: Toggle debugger UI
- **`<leader>dx`**: Terminate debugger

#### Other Features

- **`<leader>zm`**: Toggle Zen Mode
- **`<leader>xx`**: Toggle Trouble diagnostics
- **`<leader>u`**: Show undo history
- **`<leader>mp`**: Format file/selection
- **`<leader>cp`**: Copy relative file path to clipboard
- **`<leader>aa`**: Ask AI (Avante)
- **`<leader>uh`**: Clear search highlights
- **`<leader>w`**: Save file
- **`<leader>ctx`**: Toggle treesitter context

#### Harpoon

- **`<leader>ha`**: Add file to Harpoon
- **`<C-e>`**: Open Harpoon menu
- **`<leader>1-5`**: Jump to Harpoon file 1-5

#### Window Management

- **`<leader>sv`**: Split window vertically
- **`<leader>sh`**: Split window horizontally
- **`<leader>se`**: Make splits equal size
- **`<leader>sx`**: Close current split

#### Tab Management

- **`<leader>to`**: Open new tab
- **`<leader>tx`**: Close current tab
- **`<leader>tn`**: Go to next tab
- **`<leader>tp`**: Go to previous tab
- **`<leader>tf`**: Open current buffer in new tab

#### Navigation

- **`<C-h/j/k/l>`**: Navigate between windows/panes (tmux/zellij aware)
- **`<C-d>`**: Move down 20 lines
- **`<C-u>`**: Move up 20 lines
- **`J`**: Join lines (cursor stays in place)
- **`n/N`**: Next/Previous search result (centered)

## Installation

1. **Install Prerequisites**:

   ```bash
   # On macOS
   brew install neovim ripgrep fd lazygit
   ```

2. **Launch Neovim**

   Lazy.nvim will automatically bootstrap and install all plugins on first launch.

## Architecture

The configuration follows a modular structure:

- **Entry point**: `init.lua` - loads core and lazy configurations
- **Core settings**: `lua/ksch/core/`
  - `options.lua`: Neovim settings (2-space tabs, relative numbers, etc.)
  - `keymaps.lua`: Core key mappings
- **Plugin management**: `lua/ksch/lazy.lua` - Lazy.nvim bootstrap
- **Plugin configs**: `lua/ksch/plugins/` - Individual plugin configurations
- **LSP configs**: `lua/ksch/plugins/lsp/` - Language server setups

## Installed Language Servers & Tools

Automatically installed via mason-tool-installer:

- **Formatters**: prettier, stylua, isort, black
- **Python**: basedpyright, ruff, debugpy
- **Web**: typescript-language-server (vtsls), tailwindcss-language-server, emmet-language-server
- **Lua**: lua-language-server
- **And more...**
