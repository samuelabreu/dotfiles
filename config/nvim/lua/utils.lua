local M = {}

function M.is_buffer_empty()
    -- Check whether the current buffer is empty
    return vim.fn.empty(vim.fn.expand('%:t')) == 1
end

function M.has_width_gt(cols)
    -- Check if the windows width is greater than a given number of columns
    return vim.fn.winwidth(0) / 2 > cols
end

M.opts = { noremap=true, silent=true }
function M.set_keymap(mode, key, command) vim.api.nvim_set_keymap(mode, key, command, M.opts) end
function M.set_l_m(key, command) vim.api.nvim_set_keymap('n', '<leader>'..key, command..'<cr>', M.opts) end
function M.set_k(key, command) vim.api.nvim_set_keymap('n', key, command, M.opts) end
function M.set_m(key, command) vim.api.nvim_set_keymap('n', key, command..'<cr>', M.opts) end

local function buf_is_valid(bufnr)
  return vim.api.nvim_buf_is_loaded(bufnr) and vim.api.nvim_buf_get_option(bufnr, 'modifiable')
end

local function next_valid_buf(current_bufnr)
  local buflist = vim.api.nvim_list_bufs()
  local lastb = -1
  for _,v in pairs(buflist) do
    if v ~= current_bufnr then
      if buf_is_valid(v) then
        lastb = v
      end
    end
  end
  return lastb
end

function M.buf_close()
  local bufnr = vim.api.nvim_get_current_buf()
  local altbuf = vim.fn.bufnr('#')
  local nextbuf = -1
  if buf_is_valid(altbuf) then
    nextbuf = altbuf
  else
    nextbuf = next_valid_buf(bufnr)
  end
  if nextbuf == -1 then
    nextbuf = vim.api.nvim_create_buf(true, false)
  end
  vim.api.nvim_win_set_buf(0, nextbuf)
  if nextbuf ~= -1 then
    vim.api.nvim_buf_delete(bufnr, {})
  end
end

return M

