-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
--

local opts = {
    flags = {
        debounce_text_changes = 150
    },
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx"
    },
    -- root_dir = {
    --     root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
    -- },
    on_attach = function(client, bufnr)
        -- 禁用格式化功能，交给专门插件插件处理
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
        -- 绑定快捷键
        local keybindings = require('keybindings')
        keybindings.maplsp(buf_set_keymap)

        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup(
            {
                debug = false,
                disable_commands = false,
                enable_import_on_completion = false,
                -- import all
                import_all_timeout = 5000, -- ms
                -- lower numbers = higher priority
                import_all_priorities = {
                    same_file = 1, -- add to existing import statement
                    local_files = 2, -- git files or files with relative path markers
                    buffer_content = 3, -- loaded buffer content
                    buffers = 4 -- loaded buffer names
                },
                import_all_scan_buffers = 100,
                import_all_select_source = false,
                -- filter diagnostics
                filter_out_diagnostics_by_severity = {},
                filter_out_diagnostics_by_code = {},
                -- inlay hints
                auto_inlay_hints = true,
                inlay_hints_highlight = "Comment",
                -- update imports on file move
                update_imports_on_move = false,
                require_confirmation_on_move = false,
                watch_dir = nil
            }
        )
        -- required to fix code action ranges and filter diagnostics
        ts_utils.setup_client(client)
        -- no default maps, so you may want to define some here
        -- keybindings.mapTsLSP(buf_set_keymap)
    end
}

return {
    on_setup = function(server)
        server:setup(opts)
    end
}
