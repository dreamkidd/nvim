-- leader map

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

-- 分屏管理
map("n", "sv", ":vsp<CR>", opt)
map("n", "sd", ":sp<CR>", opt)

map("n", "sc", "<C-w>c", opt)
map("n", "so", "<C-w>o", opt)

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

map("i", "jj", "<ESC>", opt)

map("n", "H", "^", opt)
map("n", "L", "$", opt)

-- hop key bind
map(
    "n",
    "<leader>f",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>",
    opt
)
map(
    "n",
    "<leader>F",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>",
    opt
)

map("n", "<leader>j", "<cmd>HopLineAC<cr>", opt)
map("n", "<leader>k", "<cmd>HopLineBC<cr>", opt)
-- map('o', '<leader>f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, inclusive_jump = true })<cr>", opt)
-- map('o', '<leader>F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, inclusive_jump = true })<cr>", opt)
-- map('', '<leader>t', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>", opt)
-- map('', '<leader>T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>", opt)

-- telescope

map("", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opt)
map("", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opt)
map("", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opt)
map("", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opt)

map("n", "<Tab>", "<cmd> BufferLineCycleNext<CR>", opt)
map("n", "<s-Tab>", "<cmd> BufferLineCyclePrev<CR>", opt)

-- 查找 TODO 标签
map("n", "<leader>ft", "<cmd>TodoTelescope theme=dropdown<CR>", opt)

-- map("n", "<leader>=", "<cmd>Neoformat<CR>", opt)
map("n", "<leader>=", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)

map("n", "<leader>gg", "<cmd> :LazyGit<CR>", opt)

-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "<C-t>", ":NvimTreeToggle<CR>", opt)
-- nvimTree 列表快捷键
pluginKeys.nvimTreeList = {
    -- 打开文件或文件夹
    {key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit"},
    -- 分屏打开文件
    {key = "v", action = "vsplit"},
    {key = "h", action = "split"},
    -- 显示隐藏文件
    {key = "i", action = "toggle_ignored"}, -- Ignore (node_modules)
    {key = ".", action = "toggle_dotfiles"}, -- Hide (dotfiles)
    -- 文件操作
    {key = "<F5>", action = "refresh"},
    {key = "a", action = "create"},
    {key = "d", action = "remove"},
    {key = "r", action = "rename"},
    {key = "x", action = "cut"},
    {key = "c", action = "copy"},
    {key = "p", action = "paste"},
    {key = "s", action = "system_open"}
}

pluginKeys.maplsp = function(mapbuf)
    mapbuf("n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
    mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
    -- go xx
    mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
    mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
    mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
    mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
    mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
    -- diagnostic
    mapbuf("n", "go", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
    mapbuf("n", "gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
    mapbuf("n", "gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
    -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
    -- leader + =
    -- mapbuf('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)
end

return pluginKeys
