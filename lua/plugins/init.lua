return {
  -- NOTE : override nvim cmp with custom config
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("luasnip").config.set_config(opts)
          require "nvchad.configs.luasnip"
        end,
      },

      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
    opts = function()
      return require "configs.cmp"
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },

  {
    -- NOTE : Formatter
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },

  {
    -- NOTE : Tmux Navigator
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
  },

  {
    -- NOTE : VIM Surround
    "tpope/vim-surround",
    event = "VeryLazy",
  },
  {
    -- NOTE : VIM Easy Motion
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
    -- NOTE : Todo Comments
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
    -- NOTE : Visual Multi
    "mg979/vim-visual-multi",
    lazy = false,
  },

  {
    -- NOTE : Auto Session
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = {
      dir = vim.fn.stdpath "state" .. "/sessions/",
      need = 1,
      branch = true,
    },
  },

  {
    -- NOTE : Vim Sneak
    "justinmk/vim-sneak",
    lazy = false,
  },

  {
    -- NOTE : Super Maven Auto Suggest
    "supermaven-inc/supermaven-nvim",
    event = "VeryLazy",
    config = function()
      require "configs.supermaven"
    end,
  },
}
