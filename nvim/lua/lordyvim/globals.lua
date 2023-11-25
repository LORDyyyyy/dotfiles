--[[ Global Setting and Global Variables ]]--


vim.cmd(':setlocal spell spelllang=en_us')

vim.opt.background = 'dark'
vim.opt.termguicolors = true

vim.opt.number = true

vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4

vim.opt.mouse = 'a'

vim.opt.modifiable = true

vim.opt.clipboard = 'unnamedplus'

vim.opt.encoding = 'UTF-8'

vim.cmd('set completeopt-=preview')

vim.cmd('filetype plugin indent on')


lsp_zero_event_on_tab = 'close_menu'

-- Airline
airline_powerline_fonts = 1
if not airline_symbols then
    airline_symbols = {}
end
-- Airline symbols
airline_left_sep = ''
airline_left_alt_sep = ''
airline_right_sep = ''
airline_right_alt_sep = ''
airline_symbols.branch = ''
airline_symbols.readonly = ''
airline_symbols.linenr = ''





