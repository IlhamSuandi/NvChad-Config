local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values

-- Function to convert `%` to `/`
local function percent_to_slash(path)
  return path:gsub("%%", "/")
end

-- Function to replace home directory with `~` and `.vim` with `/`
local function replace_home_and_vim(path)
  local home = vim.fn.expand "~"
  path = path:gsub(home, "~")
  path = path:gsub("%.vim", "/")
  return path
end

-- Function to list all sessions with human-readable paths
local function list_sessions()
  local session_files = vim.fn.readdir(vim.fn.stdpath "state" .. "/sessions/")
  local session_list = {}
  for _, session in ipairs(session_files) do
    local human_readable_path = replace_home_and_vim(percent_to_slash(session))
    table.insert(session_list, human_readable_path)
  end
  return session_files, session_list
end

-- Function to delete a session by its name
local function delete_session_by_name(session_name)
  local session_files = vim.fn.readdir(vim.fn.stdpath "state" .. "/sessions/")
  for _, session_file in ipairs(session_files) do
    if replace_home_and_vim(percent_to_slash(session_file)) == session_name then
      local session_path = vim.fn.stdpath "state" .. "/sessions/" .. session_file
      if vim.fn.filereadable(session_path) == 1 then
        os.remove(session_path)
        print("Session '" .. session_name .. "' deleted.")
      else
        print("Session '" .. session_name .. "' not found.")
      end
      return
    end
  end
  print("Session '" .. session_name .. "' not found.")
end

-- Custom Telescope picker to delete sessions
local function delete_session_picker()
  local _, session_list = list_sessions()
  if #session_list == 0 then
    print "No sessions found."
    return
  end

  pickers.new({}, {
    prompt_title = 'Delete Session',
    finder = finders.new_table {
      results = session_list
    },
    sorter = conf.generic_sorter({}),
    layout_config = {
      height = 15,  -- 50% of the editor height
      preview_cutoff = 1,  -- Always show the picker even for small screens
      width = 80,   -- 60% of the editor width
      prompt_position = "top",
    },
    attach_mappings = function(prompt_bufnr, map)
      local delete_session = function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        delete_session_by_name(selection.value)
      end
      map('i', '<CR>', delete_session)
      map('n', '<CR>', delete_session)
      return true
    end,
  }):find()
end

-- Command to delete a session using Telescope picker
vim.api.nvim_create_user_command("DeleteSession", function()
  delete_session_picker()
end, {})

-- Command to delete a session using Telescope picker
vim.api.nvim_create_user_command("DeleteSession", function()
  delete_session_picker()
end, {})

require("persistence").setup {
  dir = vim.fn.stdpath "state" .. "/sessions/",
  need = 1,
  branch = true,
}
