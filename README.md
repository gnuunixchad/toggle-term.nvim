# toggle-term.nvim

A minimalist Neovim plugin to toggle and manage terminal splits.

## Features

- Toggle a persistent terminal buffer in a split
- Create new terminal buffer in new split
- Movement and resize for terinal split
- Configurable split direction, ratio, and keybindings

## Installation

### Manually
```sh
mkdir -p ${XDG_DATA_HOME}/nvim/site/pack/default/start/
cd ${XDG_DATA_HOME}/nvim/site/pack/default/start/
# clone from one of the mirrors
git clone https://github.com/gnuunixchad/toggle-term.nvim
git clone https://codeberg.org/unixchad/toggle-term.nvim
```

### vim-plug
```lua
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('gnunixchad/toggle-term.nvim')

vim.call('plug#end')
```

## Keybindings

Keybindings for both Normal mode and Terminal mode:
| Bindings | Action |
| :--- | :--- |
| <kbd>Ctrl</kbd>-<kbd>Enter</kbd> | Toggle a persistent terminal split |
| <kbd>Ctrl</kbd>-<kbd>Shift</kbd>-<kbd>Enter</kbd> | Open a new terminal split |

Keybindings for Terminal mode only:
| Bindings | Action |
| :--- | :--- |
| <kbd>leader</kbd> <kbd>ESC</kbd> | Enter Normal mode in a terminal split |
| <kbd>leader</kbd> <kbd>q</kbd> |  Delete the focused terminal buffer |
| <kbd>Ctrl</kbd>-<kbd>h</kbd> | Focus the split on the left |
| <kbd>Ctrl</kbd>-<kbd>j</kbd> | Focus the split below |
| <kbd>Ctrl</kbd>-<kbd>k</kbd> | Focus the split above |
| <kbd>Ctrl</kbd>-<kbd>l</kbd> | Focus the split on the right |
| <kbd>Ctrl</kbd>-<kbd>w</kbd> <kbd>y</kbd> | Decrease split width |
| <kbd>Ctrl</kbd>-<kbd>w</kbd> <kbd>u</kbd> | Increase split height |
| <kbd>Ctrl</kbd>-<kbd>w</kbd> <kbd>i</kbd> | Decrease split height |
| <kbd>Ctrl</kbd>-<kbd>w</kbd> <kbd>o</kbd> | Increase split width |

## Configuration

```lua
require('toggle-term').setup({
  height_ratio = 1/3,       -- 1/3 of the window height, or a float number
  direction = 'bottom',     -- open temrinal at bottom, from 'top', 'bototm',
                            -- 'left', 'right'
})
```

### Default Keybindings

```lua
-- toggle and new terminal
vim.keymap.set('n', '<C-CR>', ':TermToggle<CR>', { silent = true })
vim.keymap.set('t', '<C-CR>', '<C-\\><C-n>:TermToggle<CR>', { silent = true })
vim.keymap.set('n', '<C-S-CR>', ':TermNew<CR>', { silent = true })
vim.keymap.set('t', '<C-S-CR>', '<C-\\><C-n>:TermNew<CR>', { silent = true })

-- unfocus and close terminal
vim.keymap.set('t', '<leader><ESC>', '<C-\\><C-n>', { noremap = true })
vim.keymap.set('t', '<leader>q', '<C-\\><C-n>:quit!<CR>', { noremap = true })
vim.keymap.set('t', '<C-q>', '<C-\\><C-n>:quit!<CR>', { noremap = true })

-- movement
vim.keymap.set('t', '<C-h>', '<C-\\><C-n>:wincmd h<CR>', { noremap = true })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n>:wincmd j<CR>', { noremap = true })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n>:wincmd k<CR>', { noremap = true })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n>:wincmd l<CR>', { noremap = true })

-- resize
vim.keymap.set('t', '<C-w>y', '<C-\\><C-n>:vertical resize -2<CR>i', { noremap = true })
vim.keymap.set('t', '<C-w>u', '<C-\\><C-n>:resize +2<CR>i', { noremap = true })
vim.keymap.set('t', '<C-w>i', '<C-\\><C-n>:resize -2<CR>i', { noremap = true })
vim.keymap.set('t', '<C-w>o', '<C-\\><C-n>:vertical resize +2<CR>i', { noremap = true })
```
