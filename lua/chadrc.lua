-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",

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
    order = nil,
    modules = nil,
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
