local map = vim.api.nvim_set_keymap

-- Disable default mappings
vim.g.EasyMotion_do_mapping = 0

-- Custom EasyMotion key mappings
map("n", "<leader>w", "<Plug>(easymotion-w)", { noremap = true, silent = true })
map("n", "<leader>s", "<Plug>(easymotion-overwin-f)", { noremap = true, silent = true })
map("n", "<leader>e", "<Plug>(easymotion-e)", { noremap = true, silent = true })
map("n", "<leader>b", "<Plug>(easymotion-b)", { noremap = true, silent = true })
map("n", "<leader>j", "<Plug>(easymotion-j)", { noremap = true, silent = true })
map("n", "<leader>s", "<Plug>(easymotion-overwin-f)", { noremap = true, silent = true })
map("n", "t", "<Plug>(easymotion-t2)", { noremap = true, silent = true })
map("n", "s", "<Plug>(easymotion-s2)", { noremap = true, silent = true })
map("n", "/", "<Plug>(easymotion-sn)", {})
map("o", "/", "<Plug>(easymotion-tn)", {})
map("n", "n", "<Plug>(easymotion-next)", {})
map("n", "N", "<Plug>(easymotion-prev)", {})
