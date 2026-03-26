## Installation

1. **Backup existing config** (if any):

   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. **Copy these files**:

   ```bash
   cp -r /path/to/this/nvim ~/.config/nvim
   ```

3. **Open Neovim** — lazy.nvim auto-installs on first launch:

   ```bash
   nvim
   ```

4. **Install LSP servers** via Mason (`:Mason` in Neovim), or they install automatically.

---

## Keymap Quick Reference

| Action                   | Value                     |
| ------------------------ | ------------------------- |
| **Save**                 | `Ctrl+S`                  |
| **Save All**             | `Ctrl+Shift+S`            |
| **Close tab**            | `Ctrl+W`                  |
| **New file**             | `Ctrl+N`                  |
| **Undo**                 | `Ctrl+Z`                  |
| **Redo**                 | `Ctrl+Y` / `Ctrl+Shift+Z` |
| **Copy**                 | `Ctrl+C`                  |
| **Cut**                  | `Ctrl+X`                  |
| **Paste**                | `Ctrl+V`                  |
| **Select All**           | `Ctrl+A`                  |
| **Find**                 | `Ctrl+F`                  |
| **Find & Replace**       | `Ctrl+H`                  |
| **Quick Open**           | `Ctrl+P`                  |
| **Search in Files**      | `Ctrl+Shift+F`            |
| **Command Palette**      | `Ctrl+Shift+P`            |
| **Toggle Explorer**      | `Ctrl+B`                  |
| **Focus Explorer**       | `Ctrl+Shift+E`            |
| **Toggle Terminal**      | `` Ctrl+` ``              |
| **Toggle Comment**       | `Ctrl+/`                  |
| **Move Line Up/Down**    | `Alt+↑/↓`                 |
| **Duplicate Line**       | `Shift+Alt+↓`             |
| **Delete Line**          | `Ctrl+Shift+K`            |
| **Word Wrap Toggle**     | `Alt+Z`                   |
| **Go to Definition**     | `F12` / `gd`              |
| **Find References**      | `Shift+F12` / `gr`        |
| **Rename Symbol**        | `F2`                      |
| **Code Actions**         | `Ctrl+.`                  |
| **Format Document**      | `Shift+Alt+F`             |
| **Hover Info**           | `K`                       |
| **Next Diagnostic**      | `F8`                      |
| **Prev Diagnostic**      | `Shift+F8`                |
| **Split Editor Right**   | `Ctrl+\`                  |
| **Go Back**              | `Alt+←`                   |
| **Go Forward**           | `Alt+→`                   |
| **Next Buffer**          | `Ctrl+Tab`                |
| **Prev Buffer**          | `Ctrl+Shift+Tab`          |
| **Add Next Occurrence**  | `Ctrl+D`                  |
| **Problems Panel**       | `Ctrl+Shift+M`            |
| **Go to Symbol**         | `Ctrl+Shift+O`            |
| **Trigger Autocomplete** | `Ctrl+Space`              |

---

## Plugins

| Plugin                   | Value                              |
| ------------------------ | ---------------------------------- |
| `vscode.nvim`            | Dark+ theme                        |
| `lualine`                | Status bar                         |
| `bufferline`             | File tabs                          |
| `neo-tree`               | Explorer sidebar                   |
| `telescope`              | Quick Open / Command Palette       |
| `nvim-lspconfig` + Mason | Language extensions / IntelliSense |
| `nvim-cmp`               | Autocomplete dropdown              |
| `nvim-treesitter`        | Syntax highlighting                |
| `nvim-autopairs`         | Auto-close brackets                |
| `Comment.nvim`           | Toggle Line Comment                |
| `gitsigns`               | Source Control gutter indicators   |
| `toggleterm`             | Integrated terminal                |
| `indent-blankline`       | Indentation guides                 |
| `vim-visual-multi`       | Multiple cursors (Ctrl+D)          |
| `trouble.nvim`           | Problems panel                     |
| `nvim-notify`            | Toast notifications                |

---

## Behaviours

- ✅ Auto-save on focus lost
- ✅ Format on save (when LSP available)
- ✅ Trim trailing whitespace on save
- ✅ Insert final newline on save
- ✅ Auto-detect indentation (tabs vs spaces)
- ✅ Restore cursor position when reopening file
- ✅ Highlight yank selection briefly
- ✅ Relative paths shown in status bar
- ✅ Diagnostics shown inline and in gutter

## Delete installation

```bash
rm -rf ~/.cache/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.config/nvim
```
