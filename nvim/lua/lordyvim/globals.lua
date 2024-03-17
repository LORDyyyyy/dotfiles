--[[ Global Setting and Global Variables ]]
--
local home = os.getenv("HOME")

vim.opt.spell = true
vim.opt.spelllang = "en_us"
vim.opt.spellfile = home .. '/.config/nvim/spell/en.utf-8.add'
-- Cancel spell check on a specific file type
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "spectre_panel",
        "terminal",
        "toggleterm" },
    command = 'setlocal nospell'
})


vim.opt.background = 'dark'
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smarttab = true
vim.opt.expandtab = true

vim.opt.mouse = 'a'

vim.opt.modifiable = true

vim.opt.swapfile = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.clipboard = 'unnamedplus'

vim.opt.encoding = 'UTF-8'

vim.cmd('set completeopt-=preview')

vim.cmd('filetype plugin indent on')

vim.g.lsp_zero_event_on_tab = 'close_menu'
