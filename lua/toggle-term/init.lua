-- @author nate zhou
-- @since 2026
-- A minimalist Neovim plugin to toggle and manage terminal splits

local M = {}

M.config = {
  ratio = 1/3,
  direction = 'bottom',
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend('force', M.config, opts or {})
end

function M.get_split_command()
  local directions = {
    top = 'topleft',
    bottom = 'botright',
    left = 'vertical topleft',
    right = 'vertical botright',
  }
  return directions[M.config.direction] or 'botright'
end

function M.toggle_terminal_split()
  local current_buf = vim.api.nvim_get_current_buf()

  if vim.bo[current_buf].buftype == 'terminal' then
    vim.cmd('hide')
    return
  end

  local term_bufs = {}
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buftype == 'terminal' then
      table.insert(term_bufs, buf)
    end
  end

  for _, buf in ipairs(term_bufs) do
    local win = vim.fn.bufwinid(buf)
    if win ~= -1 then
      vim.api.nvim_set_current_win(win)
      vim.cmd('startinsert')
      return
    end
  end

  local is_vertical = M.config.direction == 'left' or M.config.direction == 'right'
  local size = is_vertical and math.floor(vim.o.columns * M.config.ratio) or math.floor(vim.o.lines * M.config.ratio)

  if #term_bufs > 0 then
    vim.cmd(M.get_split_command() .. ' ' .. size .. 'split')
    vim.api.nvim_win_set_buf(0, term_bufs[1])
    vim.cmd('startinsert')
  else
    vim.cmd(M.get_split_command() .. ' ' .. size .. 'split | terminal')
    vim.cmd('startinsert')
  end
end

function M.new_terminal_split()
  local is_vertical = M.config.direction == 'left' or M.config.direction == 'right'
  local size = is_vertical and math.floor(vim.o.columns * M.config.ratio) or math.floor(vim.o.lines * M.config.ratio)
  vim.cmd(M.get_split_command() .. ' ' .. size .. 'split | terminal')
  vim.cmd('startinsert')
end

return M
