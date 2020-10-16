local vim = vim
local M = {}

-- key mapping
--
function M.map_key(type, key, value, opts)
	vim.fn.nvim_set_keymap(type, key, value, opts or {noremap = true, silent = true});
end

-- map key mapping for buffer
function M.map_buf_key(buf, type, key, value, opts)
	vim.fn.nvim_buf_set_keymap(buf, type, key, value, opts or {noremap = true, silent = true});
end

function M.map_current_buf_key(type, key, value, opts)
  M.map_buf_key(0, type, key, value, opts)
end


return M
