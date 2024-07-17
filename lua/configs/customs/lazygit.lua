local size = 0.8
vim.g.lazygit_floating_window_use_plenary = 1 -- use plenary.nvim to manage floating window

-- Create the floating window
local function open_lazygit()
  local width = math.floor(vim.o.columns * size)
  local height = math.floor(vim.o.lines * size)
  local opts = {
    relative = "editor",
    width = width,
    height = height,
    col = math.floor((vim.o.columns - width) / 2),
    row = math.floor((vim.o.lines - height) / 2),
    border = "none",
    style = "minimal",
  }

  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, opts)
  vim.wo[win].winblend = 0
  vim.wo[win].wrap = false
  vim.wo[win].scrolloff = 0
  vim.wo[win].sidescrolloff = 8

  vim.fn.termopen("lazygit", {
    on_exit = function(_, _, _)
      vim.api.nvim_win_close(win, true)
    end,
  })

  -- prevent overflowing when in insert mode
  vim.defer_fn(function()
    vim.cmd "startinsert"
  end, 200)
end

vim.api.nvim_create_user_command("LazyGit", open_lazygit, {})
