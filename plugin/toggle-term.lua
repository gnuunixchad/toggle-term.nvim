local toggle_term = require('toggle-term')

vim.g.mapleader = ' '

vim.schedule(function()
  toggle_term.setup()
end)

vim.api.nvim_create_user_command('TermToggle', toggle_term.toggle_terminal_split, {})
vim.api.nvim_create_user_command('TermNew', toggle_term.new_terminal_split, {})

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
