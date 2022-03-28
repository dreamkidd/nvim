
local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    vim.notify("没有找到 nvim-tree")
    return
end

local list_keys = require('keybindings').nvimTreeList

nvim_tree.setup({

    auto_close = true,

    git = {
        enable = false,
    },

    -- 针对 project config
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },

    filters = {
        dotfiles = true,
        custom = { "node_modules" },
    },
    view = {

        width = 30,

        side = "left",

        hide_root_folder = false,

        auto_resize = true,

        mappings = {
            custom_only = false,
            list = list_keys,
        },

        number = false,
        relativenumber = false,

        signcolumn = "yes",
    },


    system_open = {
        cmd = "open",
    },
})



