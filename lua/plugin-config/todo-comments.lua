
local status , todoComments = pcall(require,'todo-comments')
if not status then
    vim.notify("Not Found todo-comments")
    return
end

-- TODO: note
-- FIX: FIXME
-- ISSUE: ISSUE
-- WARN: warn
-- PERF: PERFORMANCE
-- NOTE: note


-- https://github.com/folke/todo-comments.nvim
todoComments.setup({
    keywords = {
        FIX = {
            icon = " ",
            color = "#DC2626",
            alt = {"FIXME", "BUG", "FIXIT", "ISSUE", "!"}
        },
        TODO = {icon = " ", color = "#10B981"},
        HACK = {icon = " ", color = "#7C3AED"},
        WARN = {icon = " ", color = "#FBBF24", alt = {"WARNING"}},
        PERF = {icon = " ", color = "#FC9868", alt = {"OPTIM", "PERFORMANCE", "OPTIMIZE"}},
        NOTE = {icon = " ", color = "#2563EB", alt = {"INFO"}}
    }
})

