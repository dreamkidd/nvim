local status, iden_line = pcall(require, "indent_blankline")

if not status then
    vim.notify("iden_line not found")
    return
end

iden_line.setup({
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true,
    space_char_blankline = " ",
})

