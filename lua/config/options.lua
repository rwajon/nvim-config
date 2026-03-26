local opt = vim.opt

-- Appearance
opt.number         = true          -- show line numbers
opt.relativenumber = false         -- absolute numbers
opt.signcolumn     = "yes"         -- always show gutter
opt.cursorline     = true          -- highlight current line
opt.colorcolumn    = ""            -- no ruler by default
opt.wrap           = false         -- no line wrap
opt.scrolloff      = 8             -- keep lines visible above/below cursor
opt.sidescrolloff  = 8
opt.termguicolors  = true

-- Indentation
opt.expandtab      = true          -- spaces not tabs
opt.tabstop        = 4
opt.shiftwidth     = 4
opt.softtabstop    = 4
opt.smartindent    = true
opt.autoindent     = true

-- Search (case-insensitive unless uppercase present)
opt.ignorecase     = true
opt.smartcase      = true
opt.hlsearch       = true          -- highlight matches
opt.incsearch      = true          -- incremental search

-- Files
opt.encoding       = "utf-8"
opt.fileencoding   = "utf-8"
opt.undofile       = true          -- persistent undo
opt.swapfile       = false
opt.backup         = false
opt.autoread       = true          -- reload files changed outside nvim
opt.hidden         = true          -- allow switching buffers without saving

-- Editor behaviour
opt.mouse          = "a"           -- enable mouse
opt.clipboard      = "unnamedplus" -- use system clipboard
opt.updatetime     = 250           -- faster CursorHold (for LSP hints)
opt.timeoutlen     = 300
opt.splitright     = true          -- vertical splits open right
opt.splitbelow     = true          -- horizontal splits open below
opt.completeopt    = "menu,menuone,noselect"
opt.pumheight      = 10            -- max autocomplete items
opt.showmode       = false         -- mode shown in statusline instead
opt.laststatus     = 3             -- global statusline
opt.cmdheight      = 1

-- Folding (indent-based, all open by default)
opt.foldmethod     = "indent"
opt.foldlevel      = 99            -- start with all folds open
opt.foldenable     = true

-- Whitespace rendering
opt.list           = false

-- Ruler / minimap approximation: just line info in statusline
opt.ruler          = false         -- handled by statusline plugin

-- Word wrap indicator
opt.showbreak      = "↪ "

-- Format options
opt.formatoptions:remove({ "c", "r", "o" }) -- don't auto-insert comment leaders
