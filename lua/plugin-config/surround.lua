
local status , surround = pcall(require,'surround')
if not status then
    vim.notify("not found surround")
end

surround.setup({
    mappings_style = "surround"
})
