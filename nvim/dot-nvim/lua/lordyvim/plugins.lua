vim.cmd [[packadd packer.nvim]]
vim.opt.termguicolors = true


return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'


	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}


	-- airline
	use 'vim-airline/vim-airline'
	use 'vim-airline/vim-airline-themes'


	-- Live server
	use('barrett-ruth/live-server.nvim')
	require('live-server').setup()


	-- Color picker
	use('KabbAmine/vCoolor.vim')


	-- blank lines
	use('lukas-reineke/indent-blankline.nvim')
	


	-- For Commenting gcc/gbc & gc/gb
	use 'https://github.com/tpope/vim-commentary'


	-- CSS Color Preview
	use 'https://github.com/ap/vim-css-color'


	-- Developer Icons
	use 'https://github.com/ryanoasis/vim-devicons'


	-- Tagbar for code navigation
	use 'https://github.com/preservim/tagbar'


	-- Discord presence
	use 'andweeb/presence.nvim'
	require("presence").setup({
		main_image = "file",
	})


	-- Treesitter
	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	-- use { 'nvim-treesitter/nvim-tree-docs', commit = '0b0ecfcb92ed52cdaae6678dc547391df699877b' }
	use 'nvim-treesitter/playground'
	use 'norcalli/nvim-colorizer.lua'


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

	-- which key
	use {
		"folke/which-key.nvim",
		config = function()
		vim.o.timeout = true
	    vim.o.timeoutlen = 500
		require("which-key").setup{}
		end
	}

	-- NvChad Terminal
	use {
		"NvChad/nvterm",
		config = function ()
		require("nvterm").setup()
		end,
	}


	--  Surrounding ysw)	
	-- use 'http://github.com/tpope/vim-surround' 	


	-- base16 Themes
	-- use 'RRethy/nvim-base16'
	use 'tinted-theming/base16-vim'


	-- Auto JSON Formatter
	use 'XadillaX/json-formatter.vim'


	-- lsp colors
	use 'folke/lsp-colors.nvim'


	-- Enable colorizer
	require('colorizer').setup()


	-- web dev Icons
	use 'nvim-tree/nvim-web-devicons'


	-- git signs
	use 'lewis6991/gitsigns.nvim'

	-- files tabs
	use 'romgrk/barbar.nvim'

	-- Dashboard banner
	-- use({
			-- "MaximilianLloyd/ascii.nvim",
			-- requires = {"MunifTanjim/nui.nvim"}
	-- })


	use { 'glepnir/dashboard-nvim', commit = 'f7d623457d6621b25a1292b24e366fae40cb79ab' }


	-- Dracula themes
	use 'Mofiqul/dracula.nvim'

	-- trouble
	use {
		'folke/trouble.nvim',
		requires = { {'nvim-tree/nvim-web-devicons'} }
	}

	-- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional
			{'hrsh7th/cmp-cmdline'},	  -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
			{'j-hui/fidget.nvim'},            -- Optional
		}
	}



	local lsp = require('lsp-zero').preset({
		name = 'minimal',
		set_lsp_keymaps = true,
		manage_nvim_cmp = true,
		suggest_lsp_servers = false,
	})

	lsp.setup()

	-- align line
	-- use 'junegunn/vim-easy-align'


	-- multi cursor, vscode like
	use 'mg979/vim-visual-multi'

	-- markdown Preview
	-- use {'iamcco/markdown-preview.nvim'}


	-- detect the same words
	use 'RRethy/vim-illuminate'


	use {
		'kkoomen/vim-doge',
		run = ':call doge#install()'
	}

end)
