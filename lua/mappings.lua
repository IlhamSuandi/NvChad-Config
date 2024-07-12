require "nvchad.mappings"

local map = vim.keymap.set

-- NOTE : custom mappings
map("i", "jj", "<ESC>")
map("n", "<C-h>", ":TmuxNavigateLeft<CR>")
map("n", "<C-l>", ":TmuxNavigateRight<CR>")
map("n", "<C-j>", ":TmuxNavigateDown<CR>")
map("n", "<C-k>", ":TmuxNavigateUp<CR>")
map("n", "vie", "ggVG", { desc = "everything visual everything" })
map("n", "yie", "ggVGy", { desc = "everything yank everything" })
map("n", "cie", "ggVGc", { desc = "everything change everything" })
map("n", "die", "ggVGd", { desc = "everything delete everything" })
map("v", "<C-_>", "gc", { noremap = true, silent = true })
map("n", "<C-_>", "gcc", { noremap = true, silent = true })

-- -- NOTE : move line up / down
-- map("n", "<a-j>", ":m+<cr>", { noremap = true })
-- map("i", "<a-j>", "<esc>:m+<cr>gi", { noremap = true })
-- map("i", "<a-k>", "<esc>:m-2<cr>gi", { noremap = true })
-- map("v", "<a-k>", ":m-2<cr>gvgv", { noremap = true })
-- map("n", "<a-k>", ":m-2<cr>", { noremap = true })
-- map("v", "<a-j>", ":m'>+<CR>gvgv", { noremap = true })
-- map("n", "<a-J>", "yyp")
-- map("n", "<a-K>", "yyP")
-- map("v", "<a-J>", "y`>p`<")
-- map("v", "<a-K>", "y`<P`>")

-- NOTE : toggle boolean
map(
  "n",
  "<leader>tb",
  ':lua require("configs.toggle_boolean").toggle_boolean()<CR>',
  { desc = "boolean toggle", noremap = true, silent = true }
)

-- NOTE : EasyMotion
map(
  "n",
  "<leader>s",
  "<Plug>(easymotion-s2)",
  { noremap = true, silent = true, desc = "easymotion search with 1 word from entire file" }
)

map(
  "n",
  "<leader>w",
  "<Plug>(easymotion-w)",
  { noremap = true, silent = true, desc = "easymotion search by the first of the word" }
)
map("n", "<leader>k", "<Plug>(easymotion-b)", { noremap = true, silent = true, desc = "easymotion search above" })
map("n", "<leader>j", "<Plug>(easymotion-j)", { noremap = true, silent = true, desc = "easymotion search below" })
map("n", "<Leader>n", "<Plug>(easymotion-next)", { desc = "easymotion find next" })
map("n", "<Leader>N", "<Plug>(easymotion-prev)", { desc = "easymotion find prev" })

-- NOTE : Sneak
map("n", "s", "<Plug>Sneak_s", { noremap = true, silent = true, desc = "sneak search 2 words in front of cursor" })
map("n", "S", "<Plug>Sneak_S", { noremap = true, silent = true, desc = "sneak search 2 words in front of cursor" })

-- NOTE : Harpoon
local mark = require "harpoon.mark"
local ui = require "harpoon.ui"

map("n", "<leader>a", mark.add_file, { desc = "harpoon mark file", silent = true })
map("n", "<A-n>", function()
  ui.nav_next()
end, { desc = "harpoon next file", silent = true })
map("n", "<A-p>", function()
  ui.nav_prev()
end, { desc = "harpoon prev file", silent = true })
map("n", "<C-e>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { desc = "harpoon quick file", silent = true })

map(
  "n",
  "<leader>1",
  ":lua require('harpoon.ui').nav_file(1)<CR>",
  { desc = "harpoon navigate to 1", silent = true, noremap = true }
)
map(
  "n",
  "<leader>2",
  ":lua require('harpoon.ui').nav_file(2)<CR>",
  { desc = "harpoon navigate to 2", silent = true, noremap = true }
)
map(
  "n",
  "<leader>3",
  ":lua require('harpoon.ui').nav_file(3)<CR>",
  { desc = "harpoon navigate to 3", silent = true, noremap = true }
)
map(
  "n",
  "<leader>4",
  ":lua require('harpoon.ui').nav_file(4)<CR>",
  { desc = "harpoon navigate to 4", silent = true, noremap = true }
)
map(
  "n",
  "<leader>5",
  ":lua require('harpoon.ui').nav_file(5)<CR>",
  { desc = "harpoon navigate to 5", silent = true, noremap = true }
)
map(
  "n",
  "<leader>6",
  ":lua require('harpoon.ui').nav_file(6)<CR>",
  { desc = "harpoon navigate to 6", silent = true, noremap = true }
)
map(
  "n",
  "<leader>7",
  ":lua require('harpoon.ui').nav_file(7)<CR>",
  { desc = "harpoon navigate to 7", silent = true, noremap = true }
)
map(
  "n",
  "<leader>8",
  ":lua require('harpoon.ui').nav_file(8)<CR>",
  { desc = "harpoon navigate to 8", silent = true, noremap = true }
)
map(
  "n",
  "<leader>9",
  ":lua require('harpoon.ui').nav_file(9)<CR>",
  { desc = "harpoon navigate to 9", silent = true, noremap = true }
)

-- NOTE : Persistence
map("n", "<leader>qs", function()
  require("persistence").select()
end, { desc = "session select session to load" })
map("n", "<leader>ql", function()
  require("persistence").load()
end, { desc = "session load session from directory" })
map("n", "<leader>qL", function()
  require("persistence").load { last = true }
end, { desc = "session load from last session" })
map("n", "<leader>qd", function()
  require("persistence").stop()
end, { desc = "session persistence stop " })

-- NOTE :  close all buffers
map("n", "<leader>cb", "<cmd>%bd|e#<cr>", { desc = "buffer close all buffers", silent = true, noremap = true })

-- global lsp mappings
map("n", "ge", vim.diagnostic.goto_next, { desc = "goto next diagnostic" })
