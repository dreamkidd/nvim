local status, surround = pcall(require, "surround")
if not status then
    vim.notify("not found surround")
end

-- https://github.com/ur4ltz/surround.nvim

-- NOTE: n ys{motion}{char} -- add surrounding characters
-- NOTE: n cs<from><to> chage
-- NOTE: n ds{char} delete char

surround.setup(
    {
        mappings_style = "surround"
    }
)
