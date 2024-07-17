require("noice").setup {
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    hover = {
      enabled = false,
    },
    signature = {
      enabled = false,
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = false, -- position the cmdline and popupmenu together
    long_message_to_split = false, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },

  routes = {
    {
      filter = { event = "notify", find = "No information available" },
      opts = {
        skip = true,
      },
    },

    -- {
    --   view = "notify",
    --   filter = { event = "msg_showmode", find = "recording" },
    -- },
  },
}

require("notify").setup {
  background_colour = "#000000",
}

require("telescope").load_extension "notify"
