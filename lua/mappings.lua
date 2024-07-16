local map = vim.keymap.set

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "file save" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "file copy whole" })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "format files" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "lsp diagnostic loclist" })

-- tabufline
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })

map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "comment toggle", remap = true })
map("v", "<leader>/", "gc", { desc = "comment toggle", remap = true })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>th", "<cmd>Telescope themes<CR>", { desc = "telescope nvchad themes" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- new terminals
map("n", "<leader>h", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })

map("n", "<leader>v", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "terminal new vertical window" })

-- toggleable
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-t>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal new horizontal term" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })

-- blankline
map("n", "<leader>cc", function()
  local config = { scope = {} }
  config.scope.exclude = { language = {}, node_type = {} }
  config.scope.include = { node_type = {} }
  local node = require("ibl.scope").get(vim.api.nvim_get_current_buf(), config)

  if node then
    local start_row, _, end_row, _ = node:range()
    if start_row ~= end_row then
      vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start_row + 1, 0 })
      vim.api.nvim_feedkeys("_", "n", true)
    end
  end
end, { desc = "blankline jump to current context" })

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

map("n", "<A-l>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })
map("n", "<A-h>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

-- NOTE : move line up / down
map("n", "<a-j>", ":m+<cr>", { noremap = true })
map("i", "<a-j>", "<esc>:m+<cr>gi", { noremap = true })
map("i", "<a-k>", "<esc>:m-2<cr>gi", { noremap = true })
map("v", "<a-k>", ":m-2<cr>gvgv", { noremap = true })
map("n", "<a-k>", ":m-2<cr>", { noremap = true })
map("v", "<a-j>", ":m'>+<CR>gvgv", { noremap = true })
map("n", "<a-J>", "yyp")
map("n", "<a-K>", "yyP")
map("v", "<a-J>", "y`>p`<")
map("v", "<a-K>", "y`<P`>")

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
map("n", "<leader>qd", "<cmd>DeleteSession<CR>", { desc = "session select and delete session" })
map("n", "<leader>qD", function()
  require("persistence").stop()
end, { desc = "session persistence stop " })

-- NOTE :  close all buffers
map("n", "<leader>cb", "<cmd>%bd|e#<cr>", { desc = "buffer close all buffers", silent = true, noremap = true })

-- NOTE : global lsp mappings
map("n", "ge", vim.diagnostic.goto_next, { desc = "goto next diagnostic" })

-- NOTE : noice mappings
map("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "noice dismiss notification" })
