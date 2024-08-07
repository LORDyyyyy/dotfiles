vim.cmd [[packadd packer.nvim]]
vim.opt.termguicolors = true


return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    -- telescope ui select
    use { 'nvim-telescope/telescope-ui-select.nvim' }

    -- airline
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'

    -- Live server
    use('barrett-ruth/live-server.nvim')

    -- Color picker
    use('KabbAmine/vCoolor.vim')

    -- blank lines
    use('lukas-reineke/indent-blankline.nvim')

    -- For Commenting gcc/gbc & gc/gb
    use 'https://github.com/tpope/vim-commentary'

    -- CSS Color Preview
    use 'https://github.com/ap/vim-css-color'

    -- Developer Icons
    use 'ryanoasis/vim-devicons'
    -- Web dev Icons
    use 'nvim-tree/nvim-web-devicons'

    -- Tagbar for code navigation
    use 'https://github.com/preservim/tagbar'

    -- Discord presence
    use 'andweeb/presence.nvim'
    require("presence").setup({
        main_image = "file",
    })

    -- Treesitter
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use 'nvim-treesitter/playground'

    -- color highlighter
    use 'norcalli/nvim-colorizer.lua'
    -- Enable colorizer
    require('colorizer').setup()

    -- neotree
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        source_selector = { statusline = true }
    }
    -- neogit
    use {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",  -- required
            "sindrets/diffview.nvim", -- optional - Diff integration

            -- Only one of these is needed, not both.
            "nvim-telescope/telescope.nvim", -- optional
        },
        config = function()
            require('neogit').setup()
        end
    }

    -- which key
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
            require("which-key").setup {}
        end
    }

    -- Terminal
    use { "akinsho/toggleterm.nvim", tag = '*' }

    -- Themes
    use 'tinted-theming/base16-vim'
    use "folke/tokyonight.nvim"
    use 'Mofiqul/dracula.nvim'
    use 'navarasu/onedark.nvim'
    use "NLKNguyen/papercolor-theme"

    -- Auto JSON Formatter
    use 'XadillaX/json-formatter.vim'

    -- lsp colors
    use 'folke/lsp-colors.nvim'

    -- git signs
    use 'lewis6991/gitsigns.nvim'
    require('gitsigns').setup()

    -- vim-fugitive
    use 'tpope/vim-fugitive'

    -- files tabs
    use 'romgrk/barbar.nvim'

    -- Dashboard
    use { 'glepnir/dashboard-nvim', commit = 'f7d623457d6621b25a1292b24e366fae40cb79ab' }

    -- trouble
    use {
        'folke/trouble.nvim',
        requires = { { 'nvim-tree/nvim-web-devicons' } }
    }

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },                    -- Required
            { 'hrsh7th/cmp-nvim-lsp' },                -- Required
            { 'hrsh7th/cmp-buffer' },                  -- Optional
            { 'hrsh7th/cmp-path' },                    -- Optional
            { 'saadparwaiz1/cmp_luasnip' },            -- Optional
            { 'hrsh7th/cmp-nvim-lua' },                -- Optional
            { 'hrsh7th/cmp-cmdline' },                 -- Optional
            { 'hrsh7th/cmp-nvim-lsp-signature-help' }, -- Optional
            { 'hrsh7th/cmp-calc' },                    -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip',                   run = "make install_jsregexp" }, -- Required
            { 'rafamadriz/friendly-snippets' },                                    -- Optional
        }
    }

    -- multi cursor, vscode like
    use 'mg979/vim-visual-multi'

    -- markdown Preview
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    })

    -- detect the same words
    use 'RRethy/vim-illuminate'

    -- Doge auto Documentation
    use {
        'kkoomen/vim-doge',
        run = ':call doge#install()'
    }

    -- Competitive programming helper for neovim
    use 'p00f/cphelper.nvim'

    -- undotree
    use 'mbbill/undotree'

    -- session manager
    use 'Shatur/neovim-session-manager'

    -- remove highlight after search
    use {
        'nvimdev/hlsearch.nvim',
        event = 'BufRead',
        config = function()
            require('hlsearch').setup()
        end
    }
    -- navigation through search results easier
    use {
        "kevinhwang91/nvim-hlslens",
        config = function()
            require('hlslens').setup()
            require("scrollbar.handlers.search").setup({}) -- scrollbar setup
        end,
    }

    -- spectre, search and replace
    use 'nvim-pack/nvim-spectre'

    -- surround
    use({
        "kylechui/nvim-surround",
        tag = "*",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here
                -- or leave empty to use defaults
            })
            require("nvim-surround").buffer_setup()
        end
    })

    -- ufo folds
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

    -- copilot
    use 'github/copilot.vim'

    -- nvim-silicon, snapshots for your code
    use 'michaelrommel/nvim-silicon'

    -- top dropbar
    use({
        'Bekaboo/dropbar.nvim',
        requires = {
            'nvim-telescope/telescope-fzf-native.nvim'
        }
    })

    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- nvim-notify - Notifications UI
    use 'rcarriga/nvim-notify'

    -- remote ssh mounting
    use {
        'nosduco/remote-sshfs.nvim',
        requires = { { 'nvim-telescope/telescope.nvim' } },
    }
    require('remote-sshfs').setup({})

    -- symbols icons
    use 'onsails/lspkind.nvim'

    -- scrollbar
    use 'petertriho/nvim-scrollbar'


    -- leetcode.nvim
    use {
        "kawre/leetcode.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
        }
    }

    -- copilot chat
    use {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
    }

    -- open in github
    use 'almo7aya/openingh.nvim'

    -- latex live preview
    use 'xuhdev/vim-latex-live-preview'

    -- oil.nvim - file navigator
    use 'stevearc/oil.nvim'
end)
