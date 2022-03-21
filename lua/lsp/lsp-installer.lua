local status , lsp_installer = pcall(require,"nvim-lsp-installer")
if not status then
    vim.notify("nvim lsp installer not found")
    return
end

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "◍",
            -- The list icon to use for servers that are pending installation.
            server_pending = "◍",
            -- The list icon to use for servers that are not installed.
            server_uninstalled = "◍",
        }
    }
})

local servers = {
    sumneko_lua = require("lsp.config.sumneko_lua"), -- lua/lsp/config/lua.lua
    -- rust_analyzer = require("lsp.lang.rust"),
    -- jsonls = require("lsp.lang.json"),
    -- tsserver = require("lsp.config.ts"),
    -- remark_ls = require("lsp.lang.markdown"),
    -- html = {},
}

for name, _ in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found then
        if not server:is_installed() then
            print("Installing " .. name)
            server:install()
        end
    end
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
-- lsp_installer.on_server_ready(function(server)
--     -- local opts = {
--     --     on_attach = require("user.lsp.handlers").on_attach,
--     --     capabilities = require("user.lsp.handlers").capabilities,
--     -- }
--
--     -- if server.name == "jsonls" then
--     --     local jsonls_opts = require("user.lsp.settings.jsonls")
--     --     opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
--     -- end
--
--     if server.name == "sumneko_lua" then
--         local sumneko_opts = require("lsp.settings.sumneko_lua")
--         opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
--     end
--
--     -- This setup() function is exactly the same as lspconfig's setup function.
--     -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--     server:setup(opts)
-- end)

lsp_installer.on_server_ready(function(server)
    local config = servers[server.name]
    if config == nil then
        return
    end
    if config.on_setup then
        config.on_setup(server)
    else
        server:setup({})
    end
end)
