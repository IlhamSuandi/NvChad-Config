return {
  {
    -- NOTE : Tmux-Navigator
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
  },

  {
    -- NOTE : VIM-Surround
    "tpope/vim-surround",
    event = "VeryLazy",
  },

  {
    -- NOTE : VIM-Easy-Motion
    "easymotion/vim-easymotion",
    event = "VeryLazy",
    config = function()
      require "configs.easy_motion"
    end,
  },

  {
    -- NOTE : Mark Plugin
    "chentoast/marks.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.marks"
    end,
  },

  {
    -- NOTE : Todo-Comments
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = require "configs.todo_comments",
  },

  {
    -- NOTE : Harpoon
    "ThePrimeagen/harpoon",
    config = function()
      require "configs.harpoon"
    end,
  },

  {
    -- NOTE : Auto Session Persistence
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = function()
      require "configs.custom_persistence"
    end,
  },

  {
    -- NOTE : Vim-Sneak
    "justinmk/vim-sneak",
    lazy = false,
  },

  {
    -- NOTE : Super_Maven Auto Suggest
    "supermaven-inc/supermaven-nvim",
    commit = "2d9f42e0dcf57a06dce5bf8b23db427ae3b7799f",
    event = "VeryLazy",
    config = function()
      require "configs.supermaven"
    end,
  },

  {
    -- NOTE : Noice Notification
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require "configs.noice"
    end,
  },

  {
    -- NOTE : Neorg Note-taking Plugin
    "nvim-neorg/neorg",
    lazy = false,
    version = "*",
    config = function()
      require "configs.neorg"
    end,
  },

  {
    -- NOTE : Flutter-Tools Plugin for debugging flutter apps
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
      require "configs.flutter_tools"
    end,
  },

  {
    -- NOTE : debugging tools
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      -- "theHamsta/nvim-dap-virtual-text",
      -- "jbyuki/one-small-step-for-vimkind",
      -- "nvim-telescope/telescope-dap.nvim",
    },
    event = "VeryLazy",
    config = function()
      require "configs.nvim_dap"
    end,
  },

  {
    "norcalli/nvim-colorizer.lua",
    lazy = false,
    config = function()
      require("colorizer").setup()
    end,
  },
}
