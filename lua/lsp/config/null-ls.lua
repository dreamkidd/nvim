-- https://github.com/jose-elias-alvarez/null-ls.nvim
local status, null_ls = pcall(require, "null-ls")
if not status then
	vim.notify("[null-ls] not found")
	return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
	debug = false,
	sources = {
		-- rust format
		formatting.rustfmt,
		formatting.shfmt,
		formatting.stylua,
		formatting.prettier.with({
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"vue",
			"css",
			"scss",
			"less",
			"html",
			"json",
			"yaml",
			"graphql",
			"markdown",
		}),
		prefer_local = "node_modules/.bin",
	},
	on_attach = function(client)
		vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()']])
	end,
})
