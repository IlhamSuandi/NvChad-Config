local options = {
  auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
  auto_session_enable_last_session = true,
  auto_restore_enabled = true, -- Auto restore session
  auto_save_enabled = true, -- Auto save session

  cwd_change_handling = {
    restore_upcoming_session = false, -- Disabled by default, set to true to enable
    pre_cwd_changed_hook = nil, -- already the default, no need to specify like this, only here as an example
    post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
      require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
    end,
  },
}

require("auto-session").setup()
