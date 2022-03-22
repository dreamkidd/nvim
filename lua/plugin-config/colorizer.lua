local status , colorizer = pcall(require , 'colorizer')
if not status then
    vim.notify("colorizer not found")
    return
end

colorizer.setup({
    '*';
    css = {
        rgb_fn = true;
    };
    html = {names = false;}
})

