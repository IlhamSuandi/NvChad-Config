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
    -- NOTE : nvim-colorizer for coloring hex code / colors
    "norcalli/nvim-colorizer.lua",
    lazy = false,
    config = function()
      require("colorizer").setup()
    end,
  },

  {
    -- NOTE: LazyGit integration
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      vim.g.lazygit_floating_window_scaling_factor = 0.5 -- scaling factor for floating window
      vim.g.lazygit_floating_window_use_plenary = 1 -- use plenary.nvim to manage floating window

      -- Create the floating window
      local function open_lazygit()
        local width = math.floor(vim.o.columns * 0.8)
        local height = math.floor(vim.o.lines * 0.8)
        local opts = {
          relative = "editor",
          width = width,
          height = height,
          col = math.floor((vim.o.columns - width) / 2),
          row = math.floor((vim.o.lines - height) / 2),
          border = "rounded",
          style = "minimal",
        }

        local buf = vim.api.nvim_create_buf(false, true)
        local win = vim.api.nvim_open_win(buf, true, opts)
        vim.wo[win].winblend = 0
        vim.wo[win].wrap = false
        vim.wo[win].scrolloff = 0
        vim.wo[win].sidescrolloff = 8 -- Allow some margin for scrolling

        vim.fn.termopen("lazygit", {
          on_exit = function(_, _, _)
            vim.api.nvim_win_close(win, true)
          end,
        })

        -- Switch to insert mode with an autocommand
        -- vim.cmd "startinsert"
      end

      vim.api.nvim_create_user_command("LazyGit", open_lazygit, {})
    end,
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
}
