require "nvchad.options"

local opt = vim.opt
local wo = vim.wo


wo.relativenumber = true
opt.timeoutlen = 500
opt.ttimeoutlen = 10
opt.cursorline = true
opt.showmode = true
vim.o.cursorlineopt = "both"
