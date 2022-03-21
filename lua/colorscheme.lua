local colorscheme = 'nordfox'

-- https://github.com/topics/neovim-colorscheme

local status_ok, nightfox = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
    return
end

