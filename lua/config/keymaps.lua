local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader      = " "
vim.g.maplocalleader = " "

-- ─── FILE ────────────────────────────────────────────────────────────────────
map("n", "<C-s>",       "<cmd>w<CR>",           vim.tbl_extend("force", opts, { desc = "Save file" }))
map("i", "<C-s>",       "<Esc><cmd>w<CR>a",     vim.tbl_extend("force", opts, { desc = "Save file" }))
map("n", "<C-S-s>",     "<cmd>wa<CR>",          vim.tbl_extend("force", opts, { desc = "Save all" }))
map("n", "<C-w>",       "<cmd>bd<CR>",          vim.tbl_extend("force", opts, { desc = "Close tab/buffer" }))
map("n", "<C-n>",       "<cmd>enew<CR>",        vim.tbl_extend("force", opts, { desc = "New file" }))
map("n", "<C-S-n>",     "<cmd>tabnew<CR>",      vim.tbl_extend("force", opts, { desc = "New window/tab" }))

-- ─── EDIT ────────────────────────────────────────────────────────────────────
-- Undo / Redo
map("n", "<C-z>",       "u",                    vim.tbl_extend("force", opts, { desc = "Undo" }))
map("i", "<C-z>",       "<Esc>ui",              vim.tbl_extend("force", opts, { desc = "Undo" }))
map("n", "<C-y>",       "<C-r>",                vim.tbl_extend("force", opts, { desc = "Redo" }))
map("n", "<C-S-z>",     "<C-r>",                vim.tbl_extend("force", opts, { desc = "Redo" }))

-- Cut / Copy / Paste (system clipboard)
map({ "n", "v" }, "<C-c>", '"+y',               vim.tbl_extend("force", opts, { desc = "Copy" }))
map({ "n", "v" }, "<C-x>", '"+d',               vim.tbl_extend("force", opts, { desc = "Cut" }))
map({ "n", "v" }, "<C-v>", '"+p',               vim.tbl_extend("force", opts, { desc = "Paste" }))
map("i",          "<C-v>", '<Esc>"+pa',         vim.tbl_extend("force", opts, { desc = "Paste in insert" }))

-- Select All
map("n", "<C-a>",       "ggVG",                 vim.tbl_extend("force", opts, { desc = "Select all" }))
map("i", "<C-a>",       "<Esc>ggVG",            vim.tbl_extend("force", opts, { desc = "Select all" }))

-- Duplicate line
map("n", "<S-A-Down>",  "<cmd>t.<CR>",          vim.tbl_extend("force", opts, { desc = "Duplicate line down" }))
map("n", "<S-A-Up>",    "<cmd>t-1<CR>",         vim.tbl_extend("force", opts, { desc = "Duplicate line up" }))
map("v", "<S-A-Down>",  "y`>p",                 vim.tbl_extend("force", opts, { desc = "Duplicate selection" }))

-- Move lines up/down
map("n", "<A-Up>",      "<cmd>m .-2<CR>==",     vim.tbl_extend("force", opts, { desc = "Move line up" }))
map("n", "<A-Down>",    "<cmd>m .+1<CR>==",     vim.tbl_extend("force", opts, { desc = "Move line down" }))
map("v", "<A-Up>",      ":m '<-2<CR>gv=gv",     vim.tbl_extend("force", opts, { desc = "Move selection up" }))
map("v", "<A-Down>",    ":m '>+1<CR>gv=gv",     vim.tbl_extend("force", opts, { desc = "Move selection down" }))

-- Indent / Outdent
map("v", "<Tab>",       ">gv",                  vim.tbl_extend("force", opts, { desc = "Indent selection" }))
map("v", "<S-Tab>",     "<gv",                  vim.tbl_extend("force", opts, { desc = "Outdent selection" }))

-- Comment toggle — handled by Comment.nvim plugin
map("n", "<C-_>",       "gcc",                  { noremap = false, silent = true, desc = "Toggle comment" })
map("v", "<C-_>",       "gc",                   { noremap = false, silent = true, desc = "Toggle comment" })
-- Also map Ctrl+/ (some terminals send this)
map("n", "<C-/>",       "gcc",                  { noremap = false, silent = true, desc = "Toggle comment" })
map("v", "<C-/>",       "gc",                   { noremap = false, silent = true, desc = "Toggle comment" })

-- Delete line
map("n", "<C-S-k>",     "dd",                   vim.tbl_extend("force", opts, { desc = "Delete line" }))

-- ─── NAVIGATION ──────────────────────────────────────────────────────────────
-- Go to line start/end
map({ "n", "v" }, "<Home>", "^",                vim.tbl_extend("force", opts, { desc = "Go to line start" }))
map("i",          "<Home>", "<Esc>^i",          vim.tbl_extend("force", opts, { desc = "Go to line start" }))

-- Word jump
map({ "n", "v" }, "<C-Left>",  "b",             vim.tbl_extend("force", opts, { desc = "Word left" }))
map({ "n", "v" }, "<C-Right>", "w",             vim.tbl_extend("force", opts, { desc = "Word right" }))
map("i",          "<C-Left>",  "<Esc>bi",       vim.tbl_extend("force", opts, { desc = "Word left" }))
map("i",          "<C-Right>", "<Esc>wi",       vim.tbl_extend("force", opts, { desc = "Word right" }))

-- Go to file start/end
map("n", "<C-Home>", "gg",                      vim.tbl_extend("force", opts, { desc = "Go to top" }))
map("n", "<C-End>",  "G",                       vim.tbl_extend("force", opts, { desc = "Go to bottom" }))

-- Scroll without moving cursor
map("n", "<C-Up>",   "<C-y>",                   vim.tbl_extend("force", opts, { desc = "Scroll up" }))
map("n", "<C-Down>", "<C-e>",                   vim.tbl_extend("force", opts, { desc = "Scroll down" }))

-- Buffer navigation
map("n", "<C-Tab>",   "<cmd>bnext<CR>",         vim.tbl_extend("force", opts, { desc = "Next buffer" }))
map("n", "<C-S-Tab>", "<cmd>bprev<CR>",         vim.tbl_extend("force", opts, { desc = "Prev buffer" }))

-- Go back / forward
map("n", "<A-Left>",  "<C-o>",                  vim.tbl_extend("force", opts, { desc = "Go back" }))
map("n", "<A-Right>", "<C-i>",                  vim.tbl_extend("force", opts, { desc = "Go forward" }))

-- ─── SEARCH ──────────────────────────────────────────────────────────────────
-- Find (Ctrl+F)
map("n", "<C-f>",   "/",                        vim.tbl_extend("force", opts, { desc = "Find in file" }))
-- Clear search highlight
map("n", "<Esc>",   "<cmd>noh<CR><Esc>",        vim.tbl_extend("force", opts, { desc = "Clear search highlight" }))
-- Find & Replace
map("n", "<C-h>",   ":%s/",                     vim.tbl_extend("force", opts, { desc = "Find & replace" }))

-- ─── SIDEBAR / EXPLORER ──────────────────────────────────────────────────────
-- Toggle file explorer
map("n", "<C-b>",     "<cmd>Neotree toggle<CR>",   vim.tbl_extend("force", opts, { desc = "Toggle explorer" }))
map("n", "<C-S-e>",   "<cmd>Neotree focus<CR>",    vim.tbl_extend("force", opts, { desc = "Focus explorer" }))

-- ─── TERMINAL ────────────────────────────────────────────────────────────────
-- Toggle terminal
map({ "n", "t" }, "<C-`>", "<cmd>ToggleTerm<CR>", vim.tbl_extend("force", opts, { desc = "Toggle terminal" }))
-- Exit terminal mode with Escape
map("t", "<Esc>",   "<C-\\><C-n>",             vim.tbl_extend("force", opts, { desc = "Exit terminal mode" }))

-- ─── COMMAND PALETTE / FUZZY FIND ───────────────────────────────────────────
-- Command palette
map("n", "<C-S-p>",  "<cmd>Telescope commands<CR>",    vim.tbl_extend("force", opts, { desc = "Command palette" }))
-- Quick open
map("n", "<C-p>",    "<cmd>Telescope find_files<CR>",  vim.tbl_extend("force", opts, { desc = "Quick open file" }))
-- Search in files
map("n", "<C-S-f>",  "<cmd>Telescope live_grep<CR>",   vim.tbl_extend("force", opts, { desc = "Search in files" }))
-- Go to symbol
map("n", "<C-S-o>",  "<cmd>Telescope lsp_document_symbols<CR>", vim.tbl_extend("force", opts, { desc = "Go to symbol" }))

-- ─── LSP (CODE INTELLIGENCE) ─────────────────────────────────────────────────
-- Go to definition
map("n", "<F12>",    vim.lsp.buf.definition,       vim.tbl_extend("force", opts, { desc = "Go to definition" }))
map("n", "gd",       vim.lsp.buf.definition,       vim.tbl_extend("force", opts, { desc = "Go to definition" }))
-- Go to declaration
map("n", "gD",       vim.lsp.buf.declaration,      vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
-- Peek definition
map("n", "<A-F12>",  vim.lsp.buf.definition,       vim.tbl_extend("force", opts, { desc = "Peek definition" }))
-- Find references
map("n", "<S-F12>",  vim.lsp.buf.references,       vim.tbl_extend("force", opts, { desc = "Find references" }))
map("n", "gr",       vim.lsp.buf.references,       vim.tbl_extend("force", opts, { desc = "Find references" }))
-- Rename symbol
map("n", "<F2>",     vim.lsp.buf.rename,           vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
-- Hover info
map("n", "K",        vim.lsp.buf.hover,            vim.tbl_extend("force", opts, { desc = "Hover info" }))
-- Quick fix / Code action
map("n", "<C-.>",    vim.lsp.buf.code_action,      vim.tbl_extend("force", opts, { desc = "Code actions" }))
map("n", "<leader>ca", vim.lsp.buf.code_action,    vim.tbl_extend("force", opts, { desc = "Code actions" }))
-- Format document
map("n", "<S-A-f>",  function() vim.lsp.buf.format({ async = true }) end,
    vim.tbl_extend("force", opts, { desc = "Format document" }))
-- Show diagnostics
map("n", "gl",       vim.diagnostic.open_float,    vim.tbl_extend("force", opts, { desc = "Show diagnostic" }))
-- Navigate diagnostics
map("n", "<F8>",     vim.diagnostic.goto_next,     vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
map("n", "<S-F8>",   vim.diagnostic.goto_prev,     vim.tbl_extend("force", opts, { desc = "Prev diagnostic" }))

-- ─── SPLITS / PANELS ─────────────────────────────────────────────────────────
-- Split editor
map("n", "<C-\\>",   "<cmd>vsplit<CR>",           vim.tbl_extend("force", opts, { desc = "Split right" }))
-- Focus between splits
map("n", "<C-1>",    "<cmd>1wincmd w<CR>",         vim.tbl_extend("force", opts, { desc = "Focus split 1" }))
map("n", "<C-2>",    "<cmd>2wincmd w<CR>",         vim.tbl_extend("force", opts, { desc = "Focus split 2" }))
map("n", "<C-3>",    "<cmd>3wincmd w<CR>",         vim.tbl_extend("force", opts, { desc = "Focus split 3" }))

-- ─── MISC ────────────────────────────────────────────────────────────────────
-- Zoom font (approximated — change guifont size)
-- Word wrap toggle
map("n", "<A-z>",    "<cmd>set wrap!<CR>",         vim.tbl_extend("force", opts, { desc = "Toggle word wrap" }))
