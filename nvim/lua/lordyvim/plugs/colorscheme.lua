local ok, dracula = pcall(require, "dracula")
if not ok then
	return
end

dracula.setup {
	transparent_bg = true,
}

require("tokyonight").setup({
	transparent = true
})

vim.g.base16_background_transparent = 1
vim.g.base16_colorspace = 256

-- vim.cmd [[colorscheme tokyonight-night]]
-- vim.cmd [[colorscheme base16-tokyo-city-dark]]
vim.cmd [[colorscheme dracula]]


-- Cursor
vim.opt.guicursor = 'n-v-c:block-Cursor,i:ver25-iCursor,a:blinkon1'
vim.cmd [[highlight Cursor guifg=NONE guibg=#BFBFBF]] -- cursor background
