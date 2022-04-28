local c_status, catppuccin = pcall(require, "catppuccin")
if not c_status then
    vim.notify(" catppuccin not found")
end

catppuccin.setup(
    {
        transparent_background = true,
        term_color = true,
        styles = {
            comments = "italic",
            functions = "italic",
            keywords = "NONE",
            strings = "NONE",
            variables = "NONE"
        },
        integrations = {
            treesitter = true,
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = "italic",
                    hints = "italic",
                    warnings = "italic",
                    information = "italic"
                },
                underlines = {
                    errors = "underline",
                    hints = "underline",
                    warnings = "underline",
                    information = "underline"
                }
            },
            lsp_trouble = false,
            cmp = true,
            lsp_saga = false,
            gitgutter = false,
            gitsigns = true,
            telescope = true,
            nvimtree = {
                enabled = true,
                show_root = true,
                transparent_panel = true
            },
            neotree = {
                enabled = false,
                show_root = false,
                transparent_panel = false
            },
            which_key = true,
            indent_blankline = {
                enabled = true,
                colored_indent_levels = true
            },
            dashboard = true,
            neogit = false,
            vim_sneak = false,
            fern = false,
            barbar = false,
            bufferline = true,
            markdown = true,
            lightspeed = false,
            ts_rainbow = false,
            hop = true,
            notify = true,
            telekasten = true,
            symbols_outline = true
        }
    }
)

local colorscheme = "catppuccin"

-- https://github.com/topics/neovim-colorscheme

local status_ok, color = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
    return
end
