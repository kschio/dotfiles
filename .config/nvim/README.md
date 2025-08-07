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

#### Quick Access (Most Used)

- **`<leader><space>`**: Find files
- **`<leader>/`**: Live grep
- **`<leader>.`**: Recent files
- **`<leader>,`**: Toggle Harpoon menu (ultra-fast access)
- **`<Tab>` / `<S-Tab>`**: Next/Previous buffer
- **`<C-e>`**: Toggle Harpoon menu (alternative)

#### Harpoon (Jump Navigation)

- **`<leader>1-9`**: Jump to Harpoon file 1-9 (direct access)
- **`<leader>ja`**: Add file to Harpoon
- **`<leader>jd`**: Remove from Harpoon
- **`<leader>jc`**: Clear Harpoon list
- **`<leader>jn` / `<leader>jp`**: Next/Previous Harpoon
- **`<leader>jt`**: Harpoon Telescope view

#### File Navigation (Find)

- **`<leader>ff`**: Find files
- **`<leader>fg`**: Git files
- **`<leader>fr`**: Recent files
- **`<leader>fb`**: Find buffers
- **`<leader>fh`**: Find help
- **`<leader>fm`**: Find marks
- **`<leader>fk`**: Find keymaps
- **`<leader>fc`**: Find commands
- **`<leader>fC`**: Find colorscheme
- **`<leader>e`**: Toggle file explorer (neo-tree)
- **`<leader>E`**: Focus file explorer

#### Search (Content/Symbols)

- **`<leader>sg`**: Search grep
- **`<leader>sw`**: Search word under cursor
- **`<leader>sb`**: Search in buffer
- **`<leader>sB`**: Search all buffers
- **`<leader>ss`**: Search symbols (document)
- **`<leader>sS`**: Search workspace symbols
- **`<leader>sh`**: Search history
- **`<leader>sc`**: Search command history
- **`<leader>sr`**: Search registers
- **`<leader>sR`**: Resume search

#### Git Integration

- **`<leader>gg`**: Open LazyGit
- **`<leader>gc`**: Git commits
- **`<leader>gC`**: Git buffer commits
- **`<leader>gs`**: Git status
- **`<leader>gb`**: Git branches
- **`<leader>gS`**: Git stash
- **`<leader>gf`**: Git files

#### Git Hunks (gh prefix)

- **`[g` / `]g`**: Previous/Next git hunk (no leader needed)
- **`<leader>ghs`**: Stage hunk
- **`<leader>ghr`**: Reset hunk
- **`<leader>ghS`**: Stage buffer
- **`<leader>ghR`**: Reset buffer
- **`<leader>ghu`**: Undo stage hunk
- **`<leader>ghp`**: Preview hunk
- **`<leader>ghb`**: Blame line (full)
- **`<leader>ghB`**: Toggle line blame
- **`<leader>ghd`**: Diff this
- **`<leader>ghD`**: Diff this ~
- **`<leader>ghn` / `<leader>ghN`**: Next/Previous hunk

#### Code Actions (LSP Modifications)

- **`<leader>ca`**: Code actions
- **`<leader>cr`**: Code rename
- **`<leader>cf`**: Code format
- **`<leader>cs`**: Symbols (Trouble)
- **`<leader>cl`**: LSP definitions/references

#### LSP Info (Read-only)

- **`<leader>ld`**: LSP diagnostics
- **`<leader>lD`**: LSP buffer diagnostics
- **`<leader>ll`**: LSP line diagnostics
- **`<leader>ls`**: LSP document symbols
- **`<leader>lS`**: LSP workspace symbols
- **`<leader>lr`**: LSP references
- **`<leader>li`**: LSP incoming calls
- **`<leader>lo`**: LSP outgoing calls
- **`<leader>lI`**: LSP info
- **`<leader>lR`**: LSP restart

#### Go To Navigation (Non-leader)

- **`gd`**: Go to definition
- **`gr`**: Go to references
- **`gi`**: Go to implementation
- **`gt`**: Go to type definition
- **`gD`**: Go to declaration
- **`K`**: Hover documentation
- **`[d` / `]d`**: Previous/Next diagnostic

#### Debugging

- **`<leader>db`**: Toggle breakpoint
- **`<leader>dc`**: Continue
- **`<leader>dx`**: Terminate
- **`<leader>de`**: Evaluate
- **`<leader>dt`**: Toggle UI
- **`<leader>ds`**: Step over
- **`<leader>di`**: Step into
- **`<leader>do`**: Step out

#### Window/Split Management (Open)

- **`<leader>ov`**: Open vertical split
- **`<leader>oh`**: Open horizontal split
- **`<leader>oe`**: Equal split sizes
- **`<leader>oc`**: Close current split
- **`<leader>oo`**: Close other splits
- **`<C-h/j/k/l>`**: Navigate between windows (tmux/zellij aware)

#### Tab Management

- **`<leader>ot`**: Open new tab
- **`<leader>ox`**: Close current tab
- **`<leader>on`**: Next tab
- **`<leader>op`**: Previous tab
- **`<leader>of`**: Open buffer in new tab

#### Buffer Management

- **`<leader>bd`**: Delete buffer
- **`<leader>bD`**: Force delete buffer
- **`<leader>bn`**: Next buffer
- **`<leader>bp`**: Previous buffer
- **`<leader>ba`**: Delete all except current

#### AI/Avante

- **`<leader>aa`**: Ask AI
- **`<leader>ac`**: AI Chat
- **`<leader>ae`**: AI Edit

#### UI Toggles

- **`<leader>ui`**: Toggle inlay hints
- **`<leader>uw`**: Toggle word wrap
- **`<leader>un`**: Toggle line numbers
- **`<leader>ur`**: Toggle relative numbers
- **`<leader>us`**: Toggle spell check
- **`<leader>uC`**: UI colorschemes
- **`<leader>u`**: Undo history

#### Other Features

- **`<leader>w`**: Write/save file
- **`<leader>wa`**: Write all buffers
- **`<leader>qq`**: Quit
- **`<leader>qa`**: Quit all
- **`<leader>q!`**: Quit without saving
- **`<leader>mp`**: Format file/selection
- **`<leader>cp`**: Copy file path to clipboard
- **`<leader>hc`**: Clear search highlights
- **`<leader>hh`**: Help pages
- **`<leader>hm`**: Man pages
- **`<leader>hk`**: Show keymaps
- **`<leader>zm`**: Toggle Zen Mode
- **`<leader>xx`**: Diagnostics (Trouble)
- **`<leader>xX`**: Buffer diagnostics (Trouble)
- **`<leader>ctx`**: Toggle TreeSitter context
- **`<leader>+` / `<leader>-`**: Increment/Decrement number
- **`<leader>?`**: Buffer local keymaps

#### Navigation

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

## Keybinding Philosophy

The keybindings are organized for maximum efficiency:

- **Single key access** for most-used actions (`<leader><space>`, `<leader>/`, `<leader>,`)
- **Logical grouping**: 
  - `f` = Find (files/buffers - structural)
  - `s` = Search (content/symbols - semantic)
  - `g` = Git (all git operations including hunks)
  - `c` = Code (LSP actions that modify)
  - `l` = LSP (information/diagnostics)
  - `j` = Jump (Harpoon navigation)
  - `o` = Open (windows/tabs/splits)
- **Number keys** (1-9) dedicated to Harpoon for instant file switching
- **Bracket navigation** (`[`/`]`) for moving between items (diagnostics, hunks)
- **Non-leader `g` prefix** for "go to" navigation

## Installed Language Servers & Tools

Automatically installed via mason-tool-installer:

- **Formatters**: prettier, stylua, isort, black
- **Python**: basedpyright, ruff, debugpy
- **Web**: typescript-language-server (vtsls), tailwindcss-language-server, emmet-language-server
- **Lua**: lua-language-server
- **And more...**