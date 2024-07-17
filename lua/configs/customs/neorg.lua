require("neorg").setup {
  load = {
    ["core.defaults"] = {},
    ["core..concealer"] = {},
    ["core.summary"] = {},
    ["core.dirman"] = {
      config = {
        workspaces = {
          notes = "~/neorg/notes",
          journal = "~/neorg/journal",
          garden = "~/neorg/garden",
        },
      },
    },
    ["core.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
    -- ["core.journal"] = {
    --   config = {
    --     journal_folder = "~/neorg/journal",
    --     default_template = "~/neorg/templates/journal.norg",
    --   },
    -- },
  },
}
