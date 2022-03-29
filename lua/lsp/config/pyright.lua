-- -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright

local opts = {
    root_dir = function()
        return vim.fn.getcwd()
    end,
    handlers = {
        ["textDocument/publishDiagnostics"] = function(...)
        end
    },
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true
            }
        }
    },
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
        -- 绑定快捷键
        require("keybindings").maplsp(buf_set_keymap)
    end
}

return {
    on_setup = function(server)
        server:setup(opts)
    end
}
