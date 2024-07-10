require "nvchad.mappings"
local map = vim.keymap.set

map("i", "jj", "<ESC>")
map("n", "<C-h>", ":TmuxNavigateLeft<CR>")
map("n", "<C-l>", ":TmuxNavigateRight<CR>")
map("n", "<C-j>", ":TmuxNavigateDown<CR>")
map("n", "<C-k>", ":TmuxNavigateUp<CR>")
map("n", "yie", "ggVGy", { desc = "yank everything" })
map("n", "cie", "ggVGc", { desc = "change everything" })
map("n", "die", "ggVGd", { desc = "delete everything" })
map("v", "<C-_>", "gc", { noremap = true, silent = true })
map("n", "<C-_>", "gcc", { noremap = true, silent = true })

-- NOTE : move line up / down
map("n", "<a-j>", ":m+<cr>", { noremap = true, nowait = true })
map("i", "<a-j>", "<esc>:m+<cr>gi", { noremap = true, nowait = true })
map("i", "<a-k>", "<esc>:m-2<cr>gi", { noremap = true, nowait = true })
map("v", "<a-k>", ":m-2<cr>gvgv", { noremap = true, nowait = true })
map("n", "<a-k>", ":m-2<cr>", { noremap = true, nowait = true })
map("v", "<a-j>", ":m'>+<CR>gvgv", { noremap = true, nowait = true })

map("n", "<a-J>", "yyp")
map("n", "<a-K>", "yyP")
map("v", "<a-J>", "y`>p`<")
map("v", "<a-K>", "y`<P`>")

-- NOTE : toggle boolean
map(
  "n",
  "<leader>tb",
  ':lua require("configs.toggle_boolean").toggle_boolean()<CR>',
  { desc = "toggle boolean", noremap = true, silent = true }
)

-- NOTE : EasyMotion
map("n", "<leader>w", "<Plug>(easymotion-w)", { noremap = true, silent = true })
map("n", "<leader>s", "<Plug>(easymotion-overwin-f)", { noremap = true, silent = true })
map("n", "<leader>e", "<Plug>(easymotion-e)", { noremap = true, silent = true })
map("n", "<leader>b", "<Plug>(easymotion-b)", { noremap = true, silent = true })
map("n", "<leader>j", "<Plug>(easymotion-j)", { noremap = true, silent = true })
map("n", "<leader>s", "<Plug>(easymotion-overwin-f)", { noremap = true, silent = true })
map("n", "s", "<Plug>(easymotion-s2)", { noremap = true, silent = true })
map("n", "t", "<Plug>(easymotion-t2)", { noremap = true, silent = true })
map("n", "<Leader>n", "<Plug>(easymotion-next)", {})
map("n", "<Leader>N", "<Plug>(easymotion-prev)", {})

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
map(
  "n",
  "<leader>10",
  ":lua require('harpoon.ui').nav_file(10)<CR>",
  { desc = "harpoon navigate to 10", silent = true, noremap = true }
)
