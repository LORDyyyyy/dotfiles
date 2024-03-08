local util = require('lspconfig.util')
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

require('lspconfig').intelephense.setup {
    on_attach = on_attach,
    filetypes = { "php" },
    -- root_dir = util.root_pattern("composer.json", ".git"),
    root_dir = function(fname)
        return util.root_pattern(
            "composer.json", ".git"
        )(fname) or vim.fn.getcwd()
    end,
    cmd = { "/usr/bin/intelephense", "--stdio" }
}

-- `/` cmdline setup.
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})
-- `:` cmdline setup.
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        {
            name = 'cmdline',
            option = {
                ignore_cmds = { 'Man', '!' }
            }
        }
    })
})
