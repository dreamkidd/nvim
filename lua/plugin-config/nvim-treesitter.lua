local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    vim.notify("treesitter not found")
    return
end

-- see https://github.com/nvim-treesitter/nvim-treesitter
treesitter.setup{
    -- support lang
    ensure_installed = "maintained",

    -- 高亮
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<CR>',
            node_incremental = '<CR>',
            node_decremental = '<BS>',
            scope_incremental = '<TAB>',
        }
    },

    -- 替代默认的 = 格式化
    indent = {
        enable = true
    }
}

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.wo.foldlevel = 99
