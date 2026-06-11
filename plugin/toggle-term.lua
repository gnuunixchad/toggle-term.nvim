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
