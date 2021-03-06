if (vim.g.vscode) then
    require("plugin.packer_compiled")
else
    require("basic")
    require("keybindings")

    require("plugins")

    require("colorscheme")

    require("plugin-config.nvim-tree")
    require("plugin-config.bufferline")
    require("plugin-config.lualine")
    require("plugin-config.nvim-treesitter")
    require("plugin-config.hop")
    require("plugin-config.telescope")
    require("plugin-config.whichkey")
    require("plugin-config.comment")
    require("plugin-config.autopairs")
    require("plugin-config.cmp")
    require("plugin-config.indent-blankline")
    require("plugin-config.colorizer")
    require("plugin-config.surround")
    require("plugin-config.project")
    require("plugin-config.dashboard")
    require("plugin-config.todo-comments")
    require("plugin-config.gitsigns")
    require("plugin-config.fidget")

    require("lsp.init")
end
