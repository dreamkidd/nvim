-- leader map vim.g.mapleader = " " vim.g.maplocalleader = " "

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


-- 左右比例控制
map("n", "<C-l>", ":vertical resize -20<CR>", opt)
map("n", "<C-h>", ":vertical resize +20<CR>", opt)
-- 上下比例
map("n", "<C-j>", ":resize +10<CR>", opt)
map("n", "<C-k>", ":resize -10<CR>", opt)
-- 等比例
map("n", "s=", "<C-w>=", opt)

-- Visule 
-- 连续 缩进
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- 移动行
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)


map("i","jj","<ESC>",opt)





-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "<M-m>", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  -- 分屏打开文件
  { key = "v", action = "vsplit" },
  { key = "h", action = "split" },
  -- 显示隐藏文件
  { key = "i", action = "toggle_ignored" }, -- Ignore (node_modules)
  { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  -- 文件操作
  { key = "<F5>", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "s", action = "system_open" },
}
return pluginKeys
