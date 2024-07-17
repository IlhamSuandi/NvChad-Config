local M = {}

local value_pairs = {
  { "true", "false" },
  { "yes", "no" },
  { "on", "off" },
  { "log", "error" },
  { "up", "down" },
  { "left", "right" },
  { "next", "prev" },
  { "after", "before" },
  { "close", "open" },
}

function M.toggle_boolean()
  local line = vim.api.nvim_get_current_line()
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local col = cursor_pos[2] + 1 -- Convert zero-based index to one-based

  local function replace_value_at_cursor(lines, cols, value1, value2)
    local pattern = "%f[%w]" .. value1 .. "%f[%W]"
    local start_pos, end_pos = lines:find(pattern)

    while start_pos do
      if cols >= start_pos and cols <= end_pos then
        return lines:sub(1, start_pos - 1) .. value2 .. lines:sub(end_pos + 1), true
      end
      start_pos, end_pos = lines:find(pattern, end_pos + 1)
    end

    pattern = "%f[%w]" .. value2 .. "%f[%W]"
    start_pos, end_pos = lines:find(pattern)

    while start_pos do
      if cols >= start_pos and cols <= end_pos then
        return lines:sub(1, start_pos - 1) .. value1 .. lines:sub(end_pos + 1), true
      end
      start_pos, end_pos = lines:find(pattern, end_pos + 1)
    end

    return lines, false
  end

  for _, pair in ipairs(value_pairs) do
    local new_line, replaced = replace_value_at_cursor(line, col, pair[1], pair[2])
    if replaced then
      vim.api.nvim_set_current_line(new_line)
      -- Adjust cursor position if necessary
      vim.api.nvim_win_set_cursor(0, { cursor_pos[1], col - 1 })
      return
    end
  end

  vim.notify("No value found to toggle at cursor", vim.log.levels.WARN)
end

return M


