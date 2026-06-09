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
-- toggle and new terminal
vim.keymap.set('n', '<C-CR>', ':TermToggle<CR>', { silent = true })
vim.keymap.set('t', '<C-CR>', '<C-\\><C-n>:TermToggle<CR>', { silent = true })
vim.keymap.set('n', '<C-S-CR>', ':TermNew<CR>', { silent = true })
vim.keymap.set('t', '<C-S-CR>', '<C-\\><C-n>:TermNew<CR>', { silent = true })

-- escape terminal mode with vi mode shell
vim.keymap.set('t', '<leader><ESC>', '<C-\\><C-n>', { noremap = true })
vim.keymap.set('t', '<leader>q', '<C-\\><C-n>:quit!<CR>', { noremap = true })
vim.keymap.set('t', '<C-q>', '<C-\\><C-n>:quit!<CR>', { noremap = true })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n>:wincmd k<CR>', { noremap = true })

-- resize
vim.keymap.set('t', '<C-w>y', '<C-\\><C-n>:vertical resize -2<CR>i', { noremap = true })
vim.keymap.set('t', '<C-w>u', '<C-\\><C-n>:resize +2<CR>i', { noremap = true })
vim.keymap.set('t', '<C-w>i', '<C-\\><C-n>:resize -2<CR>i', { noremap = true })
vim.keymap.set('t', '<C-w>o', '<C-\\><C-n>:vertical resize +2<CR>i', { noremap = true })
```
