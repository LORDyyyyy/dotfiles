local cmp = require('cmp')


cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		['<Tab>'] = cmp.mapping.abort(),
	})
})


local cmp_nvim_lsp = require "cmp_nvim_lsp"
require("lspconfig").clangd.setup {
	capabilities = cmp_nvim_lsp.default_capabilities(),
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
	},
}
