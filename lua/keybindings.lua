
-- leader map

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opt = {noremap = true , silent = true}

-- 分屏管理
map("n","sv",":vsp<CR>",opt)
map("n","sd",":sp<CR>",opt)

map("n","sc","<C-w>c",opt)
map("n","so","<C-w>o",opt)

map("n", "<M-h>", "<C-w>h", opt)
map("n", "<M-j>", "<C-w>j", opt)
map("n", "<M-k>", "<C-w>k", opt)
map("n", "<M-l>", "<C-w>l", opt)


-- Visule 
-- 连续 缩进
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- 移动行
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)


map("i","jj","<ESC>",opt)
