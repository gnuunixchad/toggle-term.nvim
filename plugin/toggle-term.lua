local toggle_term = require('toggle-term')

vim.schedule(function()
  toggle_term.setup()
end)

vim.api.nvim_create_user_command('TermToggle', toggle_term.toggle_terminal_split, {})
vim.api.nvim_create_user_command('TermNew', toggle_term.new_terminal_split, {})

vim.keymap.set('n', '<C-CR>', ':TermToggle<CR>', { silent = true })
vim.keymap.set('t', '<C-CR>', '<C-\\><C-n>:TermToggle<CR>', { silent = true })
vim.keymap.set('n', '<C-S-CR>', ':TermNew<CR>', { silent = true })
vim.keymap.set('t', '<C-S-CR>', '<C-\\><C-n>:TermNew<CR>', { silent = true })
