--[[ Have Fun! ]]
--


local utils = require('lordyvim.plugs.utils')
vim.g.mapleader = " "


-------------------------------
-- [[ Some Key Mapping ]]--

-- Map W to w, Wq to wq, Q to q, WQ to wq
vim.cmd('command! -nargs=0 -bar W w')
vim.cmd('command! -nargs=0 -bar Q q')
vim.cmd('command! -nargs=0 -bar Wq wq')
vim.cmd('command! -nargs=0 -bar WQ wq')

vim.keymap.set('n', '<Tab>', 'a', { desc = "Map a to Tab" })

-- Unmap 's' so I can use it with "Neotree float" command freely
vim.keymap.set('n', 's', '', { desc = "Unmap s" })
vim.keymap.set('n', 's', '', { desc = "Unmap s" })

-- Save buffer by Ctrl + S
vim.keymap.set('n', '<C-s>', ':w <CR>', { desc = "Save by Ctrl + s" })
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>i', { desc = "Save by Ctrl + s in insert mode" })

-- Copy Current file's folder directory to the system clipboard
vim.keymap.set('n', '<leader>cpwd', ':lua require("lordyvim.plugs.utils").CopyFileDirectory()<CR>', { silent = true, desc = "Copy pwd" })
-- Change current directory to the current Buffer's directory
vim.keymap.set('n', '<leader>topwd', ':set autochdir<CR>', { desc = "Change working path to pwd" })
-- Change to a specific directory
vim.keymap.set('n', '<leader>todir', ':cd    ', { desc = "Change working path" })

-- Make file executable
vim.keymap.set("n", "<leader>+x", "<cmd>!chmod +x %<CR>", { silent = true , desc = "chmod +x current_file" })

-- sudo :w
vim.keymap.set('n', '<leader>rootsave', ':w !sudo tee %', { desc = "Save file as a super user (root)" })

-- Show the differences between two split files
vim.keymap.set('n', '<leader>-d=', ':windo diffthis<CR>', { desc = "Diff -> Open the Differences menu between 2 split files" })
vim.keymap.set('n', '<leader>-d0', ':windo diffoff<CR>', { desc = "Diff -> Close the Differences menu" })

-- Change tab width temporarily
vim.keymap.set('n', '<leader>ctw', ':set shiftwidth=', { desc = "Change tab width temporarily" })

-------------------------------
--[[ Selection Key Mapping ]]
--
-- C = Cursor
---- Selection keymaps
vim.keymap.set('n', '<S-End>', 'v$', { desc = "Select from cursor to end of line" })                  -- From C to End of Line
vim.keymap.set('n', '<S-Home>', 'v0', { desc = "Select from cursor to start of line" })                 -- From C Start of Line
vim.keymap.set('n', '<S-C-Home>', ':normal vgg0<CR>', { desc = "Select form cursor to Start of file" }) -- From C to Start of File
vim.keymap.set('n', '<S-C-End>', ':normal vG$<CR>', { desc = "Select from cursor to EOF" })   -- From C to EOF

-- Select all
vim.keymap.set('n', '<C-a>', 'ggVG', { desc = "Select All" })

-- Duplicate line
vim.keymap.set('n', '<S-T>', ':t.<CR>', { desc = "Duplicate line" })

-- Custom copy and cut
vim.keymap.set('n', '<C-c>', 'y')
vim.keymap.set('v', '<C-c>', 'y')
vim.keymap.set('n', '<C-x>', 'd')
vim.keymap.set('v', '<C-x>', 'd')

-- Cut line starting from the first non-white character till the end of line
vim.keymap.set('n', 'dd', '^"_d0dd', { desc = "Cut line without indent"})

-- Delete line but do not send it to system clipboard
vim.keymap.set('n', 'df', '"_dd', { desc = "Cut line to the black hole"})

-- Delete Selection in v mode but do not send it to system clipboard
vim.keymap.set('v', 'f', '"_d', { desc = "Cut Selection to the black hole in v mode" })

-- Delete character to the black hole
vim.keymap.set('n', 'f', '"_x', { desc = "Cut Character to the black hole in n mode" })

-- Copy line without the indent
vim.keymap.set('n', '<C-l>', ':lua require("lordyvim.plugs.utils").CopyTrimmedLine()<CR>', { silent = true, desc = "Copy line without indent" })

-- Copy Word
vim.keymap.set('n', '<C-w>', 'yiw', {silent = true, desc = "Copy word"})

-- Move Selected Lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selected line/s UP in v mode" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selected line/s DOWN in v mode" })

-- Change word all over the buffer
vim.keymap.set("n", "<leader>cw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = "Search and Replace word" })

-- Insert new empty line in normal mode
vim.keymap.set('n', 'qq', 'i<CR><Esc>', { desc = "Insert new empty line in normal mode" })

-- Replace current word with the last thing in the clipboard
vim.keymap.set('n', '<leader>rew', '"_ciw<C-r>+', { desc = "Replace current word with the clipboard" })
-- Replace current line with the last thing in the clipboard
vim.keymap.set('n', '<leader>rel', '"_cc<C-r>+', { desc = "Replace current line with the clipboard" })

-------------------------------
--[[ Navigation Key mapping ]]
--

-- Switch between Split screen
vim.keymap.set('n', '<A-/>', '<C-W>l', { desc = "GOTO Right Split Screen" }) -- Right
vim.keymap.set('n', '<A-,>', '<C-W>h', { desc = "GOTO Left Split Screen" }) -- Left
vim.keymap.set('n', '<A-l>', '<C-W>k', { desc = "GOTO UP Split Screen" }) -- Up
vim.keymap.set('n', '<A-.>', '<C-W>j', { desc = "GOTO Down Split Screen" }) -- Down

-- Resize Split tab
vim.keymap.set('n', '<A-;>', ':vertical resize +1<CR>', { noremap = true, silent = true, desc = "- Resize vertical" })
vim.keymap.set('n', '<A-\'>', ':vertical resize -1<CR>', { noremap = true, silent = true, desc = "- Resize vertical" })
vim.keymap.set('n', '<A-[>', ':horizontal resize +1<CR>', { noremap = true, silent = true, desc = "+ Resize horizontal" })
vim.keymap.set('n', '<A-]>', ':horizontal resize -1<CR>', { noremap = true, silent = true, desc = "- Resize horizontal" })

-- Tabs Plugin keymaps
vim.keymap.set('n', '<A-Left>', ':BufferPrevious<CR>', { silent = true, desc = "Tabs -> GOTO Next" })
vim.keymap.set('n', '<A-Right>', ':BufferNext<CR>', { silent = true, desc = "Tabs -> GOTO Prev" })
vim.keymap.set('n', '<A-m>', ':BufferClose<CR>', { silent = true, desc = "Tabs -> Buffer Tab :wq" })
vim.keymap.set('n', '<A-n>', ':BufferClose!<CR>', { silent = true, desc = "Tabs -> Buffer Tab :q!"}) -- Discard Current Buffer Saving
-- Move Tabs
vim.keymap.set('n', '<C-M-o>', ':BufferMovePrevious<CR>', { silent = true, desc = "Tabs -> Move tab to the left" })
vim.keymap.set('n', '<C-M-p>', ':BufferMoveNext<CR>', { silent = true, desc = "Tabs -> Move tab to the right" })


-------------------------------
--[[ Plugins Keymapping ]]--
-------------------------------

-- Neotree keymap
vim.keymap.set('n', '<C-f>', ':Neotree left focus<CR>', {silent = true, desc = "Neotree left focus"})
vim.keymap.set('n', '<C-g>', ':Neotree right focus<CR>', {silent = true, desc = "Neotree Right focus"})
vim.keymap.set('n', '<C-b>', ':Neotree close<CR>', {silent = true, desc = "Neotree Close"})
vim.keymap.set('n', '<leader>s', ':Neotree float<cr>', {silent = true, desc = "Neotree float"})

-------

-- VCoolor keymaps
vim.keymap.set('n', '<A-c>', ':VCoolor<CR>')
vim.keymap.set('n', '<A-v>', ':silent VCoolor ra <CR>')
vim.g.vcool_ins_rgba_map = '<A-v>'

-------

-- Telescope keymaps
vim.keymap.set('n', '<leader>tt', ':Telescope<CR>', { silent = true, desc = "T -> Telescope Menu" })
vim.keymap.set('n', '<leader>f', ':Telescope find_files<CR>', { silent = true, desc = "T -> Find files in pwd" })
vim.keymap.set('n', '<leader>d', ':Telescope oldfiles<CR>', { silent = true, desc = "T -> Old Files" })
vim.keymap.set('n', '<leader>aq', ':Telescope live_grep<CR>', { silent = true, desc = "T -> Search all over pwd" })
vim.keymap.set('n', '<leader>q', ':Telescope current_buffer_fuzzy_find<CR>', { silent = true, desc = "T -> Search in current buffer" })
vim.keymap.set('n', '<leader>ww', ':Telescope keymaps<CR>', { silent = true, desc = "T -> Keymaps CheatSheet" })
vim.keymap.set('n', '<leader>mp', ':Telescope man_pages<CR>', { silent = true, desc = "T -> man Pages" })
vim.keymap.set('n', '<leader>vs', ':Telescope lsp_document_symbols<CR>', { silent = true, desc = "T -> LSP -> Code Navigation in current buffer" })
vim.keymap.set('n', '<leader>ju', ':Telescope jumplist<CR>', { silent = true, desc = "T -> jumplist" })

-------

-- Open Terminal

vim.keymap.set('n', '<leader>tf', ':lua require("nvterm.terminal").toggle "float"<CR>', { desc = "Terminal float" })                        -- open float
vim.keymap.set('n', '<leader>tyf', ':w<CR>:lua require("nvterm.terminal").toggle "float"<CR>', { desc = "Terminal float + :w" })            -- :w then open float
vim.keymap.set('n', '<leader>th', ':lua require("nvterm.terminal").toggle "horizontal"<CR>', { desc = "Terminal horizontal" })              -- open horizontal
vim.keymap.set('n', '<leader>tyh', ':w<CR>:lua require("nvterm.terminal").toggle "horizontal"<CR>', { desc = "Terminal horizontal + :w" })  -- :w then open horizontal
vim.keymap.set('n', '<leader>tv', ':lua require("nvterm.terminal").toggle "vertical"<CR>', { desc = "Terminal vertical" })                  -- open vertical
vim.keymap.set('n', '<leader>tyv', ':w<CR>:lua require("nvterm.terminal").toggle "vertical"<CR>', { desc = "Terminal vertical + :w" })      -- :w then open vertical

-------

-- Keymaps cheat sheet
vim.keymap.set('n', '<leader>w', ':WhichKey<CR>', { silent = true, desc = "Keymaps CheatSheet" })

-------

-- Tagbar Navigation in code
vim.keymap.set('n', '<F8>', ':TagbarToggle<CR><C-W>l', { noremap = true, desc = "Code Navigation in Tab Bar" })

-------

-- Auto JSON Formatter
vim.keymap.set('n', '<C-j><C-j>', ':JSONFormatter<CR>', { desc = "JSON Formatter" })

-------

-- Trouble Toggle
vim.keymap.set('n', '<leader>e', ':TroubleToggle<CR>', { silent = true, desc = "Toggle TroubleToggle"  })

-------

-- Dashboard
vim.keymap.set('n', '<leader>hh', ':Dashboard<cr>', { silent = true, noremap = true, desc = "Dashboard" })
vim.keymap.set('n', '<leader>hn', ':DashboardNewFile<cr>', { silent = true, noremap = true, desc = "New file" })

-------

-- LSP

-- go to Declaration & Definition
vim.keymap.set('n', '<leader>gf', ':lua vim.lsp.buf.definition()<CR>', { silent = true, desc = "LSP -> Definition" })
vim.keymap.set('n', '<leader>gd', ':lua vim.lsp.buf.declaration()<CR>', { silent = true, desc = "LSP -> Declaration" })
-- Auto Formatter
vim.keymap.set('n', '<leader>ll', ':lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true, desc = "LSP -> Formatter" })
-- Change Var name across file
vim.keymap.set('n', '<leader>rq', ':lua vim.lsp.buf.rename()<CR>', { desc = "LSP -> Rename" })
-- Code Action
vim.keymap.set('n', '<leader>ko', ':lua vim.lsp.buf.code_action()<CR>', { desc = "LSP -> Code Action" })

-------

-- Markdown Preview
vim.keymap.set('n', '<leader>md', ':MarkdownPreview<CR>', { desc = "md Preview" })
vim.keymap.set('n', '<leader>mds', ':MarkdownPreviewStop<CR>', { desc = "md Preview Stop" })

-------

-- LiveServer
vim.keymap.set('n', '<leader>ls', ':LiveServerStart<CR>', { desc = "Start Live Server" })
vim.keymap.set('n', '<leader>lss', ':LiveServerStop<CR>', { desc = "Stop Live Server" })

-------

-- Doge Auto Doc

vim.g.doge_mapping = {
    generate_doc_comment = '',
    jump_forward = '',
    jump_backward = '',
}
vim.keymap.set('n', '<leader>p', '<Plug>(doge-generate)', { silent = true, desc = "Doge -> Generate Doc" })
vim.keymap.set('n', '<leader>]', '<Plug>(doge-comment-jump-forward)', { silent = true, desc = "Doge -> jump forward" })
vim.keymap.set('n', '<leader>[', '<Plug>(doge-comment-jump-backward)', { silent = true, desc = "Doge -> jump backward" })

-------

-- cphelper => competitive programming helper

vim.keymap.set('n', '<leader>cpr', ':CphReceive<CR>', { desc = "Cph -> Receive" });
vim.keymap.set('n', '<leader>cpt', ':CphTest<CR>', { desc = "Cph -> Test" });
vim.keymap.set('n', '<leader>cpe', ':CphEdit   ', { desc = "Cph -> Edit/Add" });

-------

-- undotree

vim.keymap.set('n', '<F5>', ':lua vim.cmd.UndotreeToggle()<CR><C-W>h<C-W>k', { desc = "Toggle UndoTree" })

-------

-- session manager

vim.keymap.set('n', '<leader>ts', ':SessionManager save_current_session<CR>', { desc = "Session -> save current" })
vim.keymap.set('n', '<leader>tl', ':SessionManager load_session<CR>', { desc = "Session -> load sessions" })
vim.keymap.set('n', '<leader>tnl', ':SessionManager load_last_session<CR>', { desc = "Session -> load last session" })
vim.keymap.set('n', '<leader>tpl', ':SessionManager load_current_dir_session<CR>', { desc = "Session -> load pwd session" })
vim.keymap.set('n', '<leader>td', ':SessionManager delete_session<CR>', { desc = "Session -> delete sessions" })
vim.keymap.set('n', '<leader>tpd', ':SessionManager delete_current_dir_session<CR>', { desc = "Session -> delete pwd session" })

-------

-- spectre => Search and Replace

vim.keymap.set('n', '<leader>rss', '<cmd>lua require("spectre").toggle()<CR>', { desc = "Spectre -> Toggle Menu" })
vim.keymap.set('n', '<leader>rwsa', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', { desc = "Spectre -> Search current word" })
vim.keymap.set('v', '<leader>rwsa', '<esc><cmd>lua require("spectre").open_visual()<CR>', { desc = "Spectre -> Search current word" })
vim.keymap.set('n', '<leader>rwss', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', { desc = "Spectre -> Search current word on current buffer" })

-------

-- ufo folds

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself.
vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = "UFO -> Open All Folds"})
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = "UFO -> Close All Folds"})

-------

-- copilot

vim.g.copilot_no_tab_map = true -- disable the <Tab> keymap 
vim.g.copilot_assume_mapped = true
vim.g.copilot_enabled = false

vim.keymap.set('n', '<leader>cpod', ':Copilot disable<CR>', { desc = "Copilot -> Disable"})
vim.keymap.set('n', '<leader>cpoe', ':Copilot enable<CR>', { desc = "Copilot -> Enable"})
vim.keymap.set('n', '<leader>cpop', ':Copilot panel<CR>', { desc = "Copilot -> Panel"})
vim.keymap.set('n', '<leader>cpos', ':Copilot status<CR>', { desc = "Copilot -> Status"})

vim.keymap.set("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true, desc = {"Copilot -> Accept Answer"} })

--------

-- Git

vim.keymap.set('n', '<leader>git', ':Git   ', { desc = "Git -> Write a git command" })

vim.keymap.set('n', '<leader>gtm', ':Gitsigns<CR>', { desc = "Git -> Menu" })
vim.keymap.set('n', '<leader>gtp', ':Gitsigns preview_hunk<CR>', { desc = "Git -> Preview Hunk" })
vim.keymap.set('n', '<leader>gtt', ':Gitsigns toggle_current_line_blame<CR>', { desc = "Git -> Toggle current line Blame" })

------

-- vim-illuminate 

vim.keymap.set('n', '<M-o>', ':lua require("illuminate").goto_next_reference(wrap)<CR>', { desc = "Move the cursor to the closest references before cur" })
vim.keymap.set('n', '<M-p>', ':lua require("illuminate").goto_prev_reference(wrap)<CR>', { desc = "Move the cur to the closest references after cur" })

------

-- Silicon, code snapshot

vim.keymap.set('v', '<leader>as', ':Silicon<CR>', { desc = "Silicon -> Take snapshot of current Selection in v mode" });
vim.keymap.set('v', '<leader>aa', 'gg<ESC>VG:Silicon<CR>', { desc = "Silicon -> Take snapshot of entire buffer in v mode" });
vim.keymap.set('n', '<leader>aa', 'vgg<ESC>VG:Silicon<CR>', { desc = "Silicon -> Take snapshot of entire buffer in n mode" });

-- [[ END ]] --
