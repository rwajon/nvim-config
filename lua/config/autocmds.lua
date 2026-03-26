local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Auto-save on focus lost
local autosave = augroup("AutoSave", { clear = true })
autocmd({ "FocusLost", "BufLeave" }, {
  group   = autosave,
  pattern = "*",
  command = "silent! wa",
})

-- Highlight yanked text
local yank_hl = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  group    = yank_hl,
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

-- Restore cursor position
local restore_cursor = augroup("RestoreCursor", { clear = true })
autocmd("BufReadPost", {
  group    = restore_cursor,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Auto-detect indentation
local detect_indent = augroup("DetectIndent", { clear = true })
autocmd("BufReadPost", {
  group    = detect_indent,
  callback = function()
    -- Simple detection: if file uses tabs, use tabs
    local lines = vim.api.nvim_buf_get_lines(0, 0, 50, false)
    for _, line in ipairs(lines) do
      if line:match("^\t") then
        vim.opt_local.expandtab = false
        return
      end
    end
  end,
})

-- Trim trailing whitespace on save
local trim_whitespace = augroup("TrimWhitespace", { clear = true })
autocmd("BufWritePre", {
  group    = trim_whitespace,
  pattern  = "*",
  callback = function()
    local save = vim.fn.winsaveview()
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.fn.winrestview(save)
  end,
})

-- -- Insert final newline on save
-- local final_newline = augroup("FinalNewline", { clear = true })
-- autocmd("BufWritePre", {
--   group    = final_newline,
--   pattern  = "*",
--   callback = function()
--     local lines = vim.api.nvim_buf_get_lines(0, -2, -1, false)
--     if lines[1] and lines[1] ~= "" then
--       vim.api.nvim_buf_set_lines(0, -1, -1, false, { "" })
--     end
--   end,
-- })

-- Close certain panels with q
local close_with_q = augroup("CloseWithQ", { clear = true })
autocmd("FileType", {
  group   = close_with_q,
  pattern = { "help", "qf", "man", "lspinfo", "notify", "checkhealth" },
  callback = function(event)
    vim.keymap.set("n", "q", "<cmd>close<CR>",
      { buffer = event.buf, silent = true, desc = "Close panel" })
  end,
})

-- Auto-format on save for LSP-attached buffers
local format_on_save = augroup("FormatOnSave", { clear = true })
autocmd("BufWritePre", {
  group    = format_on_save,
  callback = function()
    if vim.lsp.get_active_clients({ bufnr = 0 })[1] then
      vim.lsp.buf.format({ async = false, timeout_ms = 1000 })
    end
  end,
})
