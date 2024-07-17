-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",

  hl_add = {
    StatusLineUsername = { fg = "#81C8BE" },
    StatusLineNoiceRecording = { fg = "#E78284" },
  },

  hl_override = {
    CursorLine = { bg = "#424757" },
    Visual = { bg = "grey_fg2" },
    LineNr = { fg = "#7b797b" },
    Comment = { fg = "#a1a1a1", italic = true },
    ["@comment"] = { fg = "#a1a1a1", italic = true },
  },

  transparency = true,

  statusline = {
    theme = "default",
    separator_style = "arrow",
    order = {
      "mode",
      "file",
      "git",
      "noice_recording",
      "lsp_msg",
      "%=",
      "username",
      "diagnostics",
      "lsp",
      "cwd",
      "cursor",
    },
    modules = {
      username = function()
        local username = os.getenv "USER"

        return "%#StatusLineUsername# " .. username .. " "
      end,
      noice_recording = function()
        local noice = require "noice"
        local recording_status = noice.api.statusline.mode.get()
        if noice.api.statusline.mode.has() and recording_status:find "recording" then
          return "%#StatusLineNoiceRecording# " .. recording_status .. " "
        else
          return ""
        end
      end,
    },
  },

  nvdash = {
    load_on_startup = true,

    header = {
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
    },

    buttons = {
      {
        "󰦛  Last Session",
        "Spc q l",
        function()
          require("persistence").load()
        end,
      },
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
      { "󰁯  Session", "Spc q s", "select session" },
    },
  },
}

return M
