# toggle-term.nvim

A minimalist Neovim plugin to toggle and manage terminal splits.

## Features

- <kbd>Ctrl</kbd><kbd>Enter</kbd> toggles a persistent terminal split with a
  single keymap
- <kbd>Ctrl</kbd><kbd>Shift</kbd><kbd>Enter</kbd> creates new terminal splits on
  demand
- Configurable split direction, ratio, and keybindings

## Installation

### vim-plug
```lua
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('gnunixchad/toggle-term.nvim')

vim.call('plug#end')
```

## Configuration

```lua
require('toggle-term').setup({
  height_ratio = 1/3,       -- 1/3 of the window height
  direction = 'bottom',     -- open temrinal at bottom
})
```

## Keybindings

Here are the default keybindings:

```lua
vim.keymap.set('n', '<C-t>', ':TermToggle<CR>', { silent = true })
vim.keymap.set('t', '<C-t>', '<C-\\><C-n>:TermToggle<CR>', { silent = true })
vim.keymap.set('n', '<leader>tn', ':TermNew<CR>', { silent = true })
vim.keymap.set('t', '<leader>tn', '<C-\\><C-n>:TermNew<CR>', { silent = true })
```
