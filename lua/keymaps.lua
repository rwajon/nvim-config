vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)

-- New buffer
vim.keymap.set('n', '<C-t>', '<cmd>enew<CR>')
vim.keymap.set('i', '<C-t>', '<cmd>enew<CR>')

-- Select all
vim.keymap.set('n', '<C-a>', 'ggVG')

-- Copy
vim.keymap.set('n', '<C-S-c>', '<cmd>%y+<CR>') -- copy all

-- save file
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>')
vim.keymap.set('i', '<C-s>', '<cmd>w<CR>')

-- undo changes
vim.keymap.set('n', '<C-u>', '<cmd>undo<CR>')
vim.keymap.set('n', '<C-z>', '<cmd>undo<CR>')
vim.keymap.set('i', '<C-u>', '<cmd>undo<CR>')
vim.keymap.set('i', '<C-z>', '<cmd>undo<CR>')

-- redo changes
vim.keymap.set('n', '<C-r>', '<cmd>redo<CR>')
vim.keymap.set('n', '<C-y>', '<cmd>redo<CR>')
vim.keymap.set('i', '<C-r>', '<cmd>redo<CR>')
vim.keymap.set('i', '<C-y>', '<cmd>redo<CR>')

-- close
vim.keymap.set('n', '<C-w>', '<cmd>q<CR>')

-- NvimTree
vim.keymap.set('n', '<C-b>', '<cmd>NvimTreeToggle<CR>')

-- Terminal
vim.keymap.set('n', '<C-`>', '<cmd>ToggleTerm<CR>')

-- Telescope
vim.keymap.set('n', '<C-S-f>', '<cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<C-S-g>', '<cmd>Telescope live_grep<CR>')
-- vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
-- vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<CR>')

-- Split window
vim.keymap.set('n', '<C-]>', '<cmd>vsplit<CR>')
