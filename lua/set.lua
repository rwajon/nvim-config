vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.o.completeopt = 'menuone,noselect'
vim.wo.number = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
-- vim.cmd.colorscheme "catppuccin"
-- vim.cmd.colorscheme "gruvbox"
vim.cmd.colorscheme "tokyonight-night"

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
