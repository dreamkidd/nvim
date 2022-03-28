-- https://github.com/j-hui/fidget.nvim
--
local status , fidget = pcall(require,'fidget')
if not status then
    vim.notify('Not found fidget')
end

fidget.setup({
    window = {
        blend = 0,
    }
})
