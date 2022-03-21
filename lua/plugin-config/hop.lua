-- hop config
-- https://github.com/phaazon/hop.nvim


local status, hop = pcall(require, "hop")
if not status then
    vim.notify("hop not found")
    return
end

hop.setup({
    keys = 'etovxqpdygfblzhckisuran' ,
    jump_on_sole_occurrence = false
})
