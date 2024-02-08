--[[ Have Fun! ]]--

vim.g.mapleader = " "


-------------------------------
-- [[ Some Key Mapping ]]-

-- Map W to w, Wq to wq, Q to q, WQ to wq 
vim.cmd('command! -nargs=0 -bar W w')
vim.cmd('command! -nargs=0 -bar Q q')
vim.cmd('command! -nargs=0 -bar Wq wq')
vim.cmd('command! -nargs=0 -bar WQ wq')

vim.keymap.set('n', '<Tab>', 'a')

vim.keymap.set('n', '<C-s>', ':w <CR>')
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>i')

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

-- Copy line
vim.keymap.set('n', '<C-l>', 'yy')

-- Copy Word
vim.keymap.set('n', '<C-w>', 'yiw')


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
vim.keymap.set('n', '<A-Left>', ':BufferPrevious<CR>', { silent = true })
vim.keymap.set('n', '<A-.>', ':BufferNext<CR>', { silent = true })
vim.keymap.set('n', '<A-Right>', ':BufferNext<CR>', { silent = true })
vim.keymap.set('n', '<A-m>', ':BufferClose<CR>', { silent = true })
vim.keymap.set('n', '<A-n>', ':BufferClose!<CR>', { silent = true }) -- Discard Current Buffer Saving
-- Move Tabs
vim.keymap.set('n', '<C-e>', ':BufferMovePrevious<CR>', { silent = true })
vim.keymap.set('n', '<C-r>', ':BufferMoveNext<CR>', { silent = true })


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
vim.keymap.set('n', '<leader>aq', ':Telescope live_grep<CR>', { silent = true })
vim.keymap.set('n', '<leader>q', ':Telescope current_buffer_fuzzy_find<CR>', { silent = true })
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

-- LSP
-- go to Declaration and Definition
vim.keymap.set('n', '<leader>gf', ':lua vim.lsp.buf.definition()<CR>', { silent = true })
vim.keymap.set('n', '<leader>gd', ':lua vim.lsp.buf.declaration()<CR>', { silent = true })
--Auto Formatter
vim.keymap.set('n', '<leader>ll', ':lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })
-- Change Var name across file
vim.keymap.set('n', '<leader>rq', ':lua vim.lsp.buf.rename()<CR>')

-------

-- Markdown Preview
vim.keymap.set('n', '<leader>md', ':MarkdownPreview<CR>')
vim.keymap.set('n', '<leader>mds', ':MarkdownPreviewStop<CR>')

-------

-- LiveServer
vim.keymap.set('n', '<leader>ls', ':LiveServerStart<CR>')
vim.keymap.set('n', '<leader>lss', ':LiveServerStop<CR>')

-------

-- Doge Auto Doc

vim.g.doge_mapping = {
	generate_doc_comment = '',
	jump_forward = '',
	jump_backward = '',
}
vim.keymap.set('n', '<leader>p', '<Plug>(doge-generate)', { silent = true })
vim.keymap.set('n', '<leader>]', '<Plug>(doge-comment-jump-forward)', { silent = true })
vim.keymap.set('n', '<leader>[', '<Plug>(doge-comment-jump-backward)', { silent = true })



--[[ END ]]--
