require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jj", "<ESC>")
map("n", "<A-J>", "yyp")
map("n", "<A-K>", "yyP")
map("n", "<A-k>", "ddkP")
map("n", "<A-j>", "ddp")
map("n", "<C-h>", ":TmuxNavigateLeft<CR>")
map("n", "<C-l>", ":TmuxNavigateRight<CR>")
map("n", "<C-j>", ":TmuxNavigateDown<CR>")
map("n", "<C-k>", ":TmuxNavigateUp<CR>")
map(
  "n",
  "<leader>tb",
  ':lua require("configs.toggle_boolean").toggle_boolean()<CR>',
  { desc = "toggle boolean", noremap = true, silent = true }
)
map("n", "yie", "ggVGy", { desc = "yank everything" })
map("n", "die", "ggVGd", { desc = "delete everything" })
map("n", "cie", "ggVGc", { desc = "change everything" })
map("n", "<C-_>", "gcc", { noremap = true, silent = true })
map("v", "<C-_>", "gc", { noremap = true, silent = true })
