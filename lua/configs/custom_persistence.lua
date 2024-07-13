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

-- Function to list all sessions with indexes
local function list_sessions()
  local session_files = vim.fn.readdir(vim.fn.stdpath "state" .. "/sessions/")
  local session_list = { "delete session:" }
  for i, session in ipairs(session_files) do
    local human_readable_path = replace_home_and_vim(percent_to_slash(session))
    table.insert(session_list, i .. ": " .. human_readable_path)
  end
  return session_files, session_list
end

-- Function to delete a session by its index
local function delete_session_by_index(index)
  local session_files, _ = list_sessions()
  if index < 1 or index > #session_files then
    print "Invalid session index"
    return
  end
  local session_file = session_files[index]
  local session_path = vim.fn.stdpath "state" .. "/sessions/" .. session_file
  if vim.fn.filereadable(session_path) == 1 then
    os.remove(session_path)
    print("Session '" .. percent_to_slash(session_file) .. "' deleted.")
  else
    print("Session '" .. percent_to_slash(session_file) .. "' not found.")
  end
end

-- Command to delete a session by index
vim.api.nvim_create_user_command("DeleteSession", function()
  local session_files, session_list = list_sessions()
  if #session_files == 0 then
    print "No sessions found."
    return
  end

  local choice = vim.fn.inputlist(session_list)
  if choice == 0 then
    print "Cancelled."
    return
  end
  delete_session_by_index(choice)
end, {})

require("persistence").setup {
  dir = vim.fn.stdpath "state" .. "/sessions/",
  need = 1,
  branch = true,
}
