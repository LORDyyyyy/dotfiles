local lspconfig = require('lspconfig')
local luasnip = require('luasnip')
local util = require('lspconfig.util')
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_nvim_lsp = require "cmp_nvim_lsp"
local lspkind = require('lspkind')
local home = os.getenv("HOME")

local lsp = require('lsp-zero').preset({
    -- name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = true,
})
lsp.setup()

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        lsp.default_setup,
    },
})

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load(
    {
        paths = { home .. '/.config/nvim/lua/lordyvim/snippets' }
    }
)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        underline = true,
    }
)

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-e>'] = cmp.mapping.abort(),

        -- Show completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate in auto-completion menu
        ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),

        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    }),
    sources = {
        { name = 'luasnip' },
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'calc' }
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text', -- show only symbol annotations
            maxwidth = 50,        -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            -- can also be a function to dynamically calculate max width such as
            -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
            ellipsis_char = '...',    -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            show_labelDetails = true, -- show labelDetails in menu. Disabled by default

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function(entry, vim_item)
                return vim_item
            end
        })
    }
})

lspconfig.clangd.setup {
    capabilities = cmp_nvim_lsp.default_capabilities(),
    cmd = {
        "clangd",
        "--offset-encoding=utf-16",
        "--completion-style=detailed"
    },
}

lspconfig.intelephense.setup {
    on_attach = on_attach,
    filetypes = { "php", "blade.php" },
    single_file_support = true,
    root_dir = util.root_pattern("composer.json", ".git"),
    cmd = { "/usr/bin/intelephense", "--stdio" }
}

require('luasnip').filetype_extend("php", { "html" })
require('luasnip').filetype_extend("ejs", { "html" })
lspconfig.html.setup {
    filetypes = { "html", "templ", "php", "ejs" },
    init_options = {
        configurationSection = { "html", "css", "php" },
        embeddedLanguages = {
            css = true,
            php = true,
            ejs = true
        },
        provideFormatter = true
    }
}

-- run :PylspInstall pyls-flake8 pyls-isort
lspconfig.pylsp.setup {
    settings = {
        pylsp = {
            plugins = {
                pyls_isort = { enabled = true },
                pyls_flake8 = { enabled = true },
                pylsp_mypy = { enabled = false },
            }
        }
    }
}

-- `/` cmdline setup.
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
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
