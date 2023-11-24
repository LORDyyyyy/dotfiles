--[[ Have Fun! ]]--

vim.g.mapleader = " "



-------------------------------
-- [[ Some Key Mapping ]]-

-- Map W to w, Wq to wq, Q to q, WQ to wq 
vim.cmd('command! -nargs=0 -bar W w')
vim.cmd('command! -nargs=0 -bar Q q')
vim.cmd('command! -nargs=0 -bar Wq wq')
vim.cmd('command! -nargs=0 -bar WQ wq')

vim.keymap.set('n', '<Tab>', 'i')




-------------------------------
--[[ Selection Key Mapping ]]--
-- C = Cursor
---- Selection keymaps
vim.keymap.set('n', '<S-End>', 'v$') -- From C to End of Line
vim.keymap.set('n', '<S-Home>', 'v0') -- From C Start of Line
vim.keymap.set('n', '<S-C-Home>', ':normal vgg0<CR>') -- From C to Start of Files
vim.keymap.set('n', '<S-C-End>', ':normal vG$<CR>') -- From C to EOF

-- Select all
vim.keymap.set('n', '<C-a>', 'ggVG')

-- Duplicate line
vim.keymap.set('n', '<S-T>', ':t.<CR>')

-- Custom copy and cut
vim.keymap.set('n', '<C-c>', 'y')
vim.keymap.set('v', '<C-c>', 'y')
vim.keymap.set('n', '<C-x>', 'd')
vim.keymap.set('v', '<C-x>', 'd')



-------------------------------
--[[ Navigation Key mapping ]]--

-- Switch between Splitted screen
vim.keymap.set('n', '<A-l>', '<C-W>l') -- Right
vim.keymap.set('n', '<A-k>', '<C-W>h') -- Left
vim.keymap.set('n', '<A-u>', '<C-W>k') -- Up
vim.keymap.set('n', '<A-j>', '<C-W>j') -- Down

-- Resize Splitted tab
vim.keymap.set('n', '<A-;>', ':vertical resize +1<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-\'>', ':vertical resize -1<CR>', { noremap = true, silent = true })

-- Tabs Plugin keymaps
vim.keymap.set('n', '<A-,>', ':BufferPrevious<CR>', { silent = true })
vim.keymap.set('n', '<A-.>', ':BufferNext<CR>', { silent = true })
vim.keymap.set('n', '<A-m>', ':BufferClose<CR>', { silent = true })
vim.keymap.set('n', '<A-n>', ':BufferClose!<CR>', { silent = true }) -- Discard Current Buffer Saving



-------------------------------
--[[ Plugins Keymapping ]]--

-- Neotree keymap
vim.keymap.set('n', '<C-f>', ':Neotree left focus<CR>')
vim.keymap.set('n', '<C-b>', ':Neotree close<CR>')
vim.keymap.set('n', '<leader>s', ':Neotree float<cr>')

-------

-- VCoolor keymaps
vim.keymap.set('n', '<A-c>', ':VCoolor<CR>')
vim.keymap.set('n', '<A-v>', ':silent VCoolor ra <CR>')
vim.g.vcool_ins_rgba_map = '<A-v>'

-------

-- Telescope keymaps
vim.keymap.set('n', '<leader>f', ':Telescope find_files<CR>', { silent = true })
vim.keymap.set('n', '<leader>d', ':Telescope oldfiles<CR>', { silent = true })
vim.keymap.set('n', '<leader>q', ':Telescope live_grep<CR>', { silent = true })
vim.keymap.set('n', '<leader>ww', ':Telescope keymaps<CR>', { silent = true })
vim.keymap.set('n', '<leader>mp', ':Telescope man_pages<CR>', { silent = true })

-------

-- Open Terminal
vim.keymap.set('n', '<leader>tt', ':lua require("nvterm.terminal").toggle "float"<CR>') -- open
vim.keymap.set('n', '<leader>ty', ':w<CR>:lua require("nvterm.terminal").toggle "float"<CR>') -- save then open float
vim.keymap.set('n', '<leader>uy', ':w<CR>:lua require("nvterm.terminal").toggle "horizontal"<CR>') -- save then open horizontal

-------

-- Keymaps cheat sheet
vim.keymap.set('n', '<leader>w', ':WhichKey<CR>', { silent = true })

-------

-- Navigation in code
vim.keymap.set('n', '<F8>', ':TagbarToggle<CR>')

-------

-- Auto JSON Formatter
vim.keymap.set('n', '<C-j><C-j>', ':JSONFormatter<CR>')

-------

-- Trouble Toggle
vim.keymap.set('n', '<leader>e', ':TroubleToggle<CR>', { silent = true })

-------

-- Dashboard
vim.keymap.set('n', '<leader>h', ':Dashboard<cr>', { silent = true, noremap = true, desc = "Dashboard" })
vim.keymap.set('n', '<leader>hn', ':DashboardNewFile<cr>', { silent = true, noremap = true, desc = "New file" })

-------

-- LSP go to Declaration and Definition
vim.keymap.set('n', '<leader>gf', ':lua vim.lsp.buf.definition()<CR>', { silent = true })
vim.keymap.set('n', '<leader>gd', ':lua vim.lsp.buf.declaration()<CR>', { silent = true })

-------

-- Markdown Preview
vim.keymap.set('n', '<leader>md', ':MarkdownPreview<CR>')
vim.keymap.set('n', '<leader>mds', ':MarkdownPreviewStop<CR>')

-------

-- LiveServer
vim.keymap.set('n', '<leader>ls', ':LiveServerStart<CR>')
vim.keymap.set('n', '<leader>lss', ':LiveServerStop<CR>')




--[[ END ]]--
