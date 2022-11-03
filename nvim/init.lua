-- Core
require "ksch.settings.options"
require "ksch.settings.mappings"
require "ksch.settings.plugins"

-- Commands
require "ksch.commands.autocommands"

-- Edit
require "ksch.edit.autopairs"
require "ksch.edit.cmp"
require "ksch.edit.treesitter"
require "ksch.edit.luasnip"
require "ksch.edit.comment"
require "ksch.edit.surround"
require "ksch.edit.gomove"

-- Appearance
require "ksch.appearance.dashboard"
require "ksch.appearance.colorscheme"
require "ksch.appearance.colorizer"
require "ksch.appearance.web-devicons"
require "ksch.appearance.bufferline"
require "ksch.appearance.lualine"
require "ksch.appearance.true-zen"

-- Git
require "ksch.git.gitsigns"
require "ksch.git.neogit"
require "ksch.git.diffview"

-- LSP
require "ksch.lsp"

-- Navigation
require "ksch.navigation.nvim-tree"
require "ksch.navigation.trouble"
require "ksch.navigation.telescope"

-- Markdown
require "ksch.markdown.glow"
require "ksch.markdown.markdown-preview"

-- Notes
require "ksch.misc.telekasten"

-- Settings
require "ksch.settings.bufdel"
require "ksch.settings.whichkey"
require "ksch.settings.toggleterm"

-- Debug
require "ksch.misc.dap"
