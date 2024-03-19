#### Table of Content
- [vim](#vim)
- [vim macros](#vim-macros)
- [nvim-surround](#nvim-surround)
- [Spelling](#spelling)
- [NeoTree](#neotree)
- [NeoGit](#neogit)
- [UFO Folding](#ufo-folding)
- [copilot](#copilot)
- [vim-visual-multi](#vim-visual-multi)
- [doge doc](#doge-doc)
- [nvim-silicon](#nvim-silicon)
- [telescope](#telescope)
- [telescope + git](#telescope-and-git)
- [Auto Completion](#auto-completion)
- [commentary.vim](#commentary.vim)

***
### vim

##### Normal Mode

](# Command  | Description                                         |
| -------- | --------------------------------------------------- |
| r\[char] | change the character on the curr cur                |
| ~        | change case on the current cursor while on 'n' mode |
| viw      | select current word                                 |
| diw      | cut/delete current word                             |
| V        | select current line                                 |
| df       | cut/delete line to the black hole                   |
| .        | repeat last operation                               |
| n        | repeat search                                       |
| V        | select line in visual mode                          |
| gx       | open link/file under cursor                         |
| gv       | select last selected text in v mode                 |

###### Moving cursor:

| Command | Motion                                        |
| ------- | --------------------------------------------- |
| w       | move cursor to the beginning of the next word |
| e       | move cursor to the end of the next word       |
| b       | move cursor to the beginning of the prev word |
| ge      | move cursor to the end of the prev word       |
| ^       | move cursor to beginning of line              |
| 0       | move cursor to beginning of line              |
| $       | move cursor to end of line                    |
| *       | goes to the next matching word                |
| #       | goes to the previous matching word            |
| G       | GOTO last line                                |
| 6G      | GOTO line 6                                   |


Insert Mode

| Command  | Description |
| -------- | ----------- |
| Ctrl + S | Save Buffer |

Visual Mode

| Commnad | Description |
| ------- | ----------- |
| V       | select line |

Commands:

| Command | Description |
| ------- | ----------- |
| :n      | GOTO line n |


***
### vim macros
Start recording a macro by: `q` + any wanted key to save the macro, lets say `h`.
Then start do what you want.<br>
After finishing, in normal mode, press `q` to stop recording.<br>
to activate the macro: `@h`.<br>
To activate the macro 5 times in a row, `5@h`  and so on.<br>
[Macros: Vim Commands](https://www.youtube.com/watch?v=vEToFNSuqrk)
***
### nvim-surround
[nvim-surround](https://github.com/kylechui/nvim-surround)
[All Keymaps are here](https://github.com/kylechui/nvim-surround/blob/main/doc/nvim-surround.txt)
The `*` indicates the cursor position.

| Old text                     | Command    | New text                     |
| ---------------------------- | ---------- | ---------------------------- |
| surr*ound_words              | ysiw)      | (surround_words)             |
| *make strings                | ys$"       | "make strings"               |
| "append me"                  | ysa"]      | ["append me"]                |
| 'change quot*es'             | cs'"       | "change quotes"              |
| func("change func name")     | csf        | new_name("change func name") |
| [delete ar*ound me!]         | ds]        | delete around me!            |
| func("del func call")        | dsf        | "del func call"              |
| remove \<b>HTML t*ags\</b>   | dst        | remove HTML tags             |
| \<b>or tag* types\</b>       | csth1\<CR> | \<h1>or tag types\</h1>      |
| "delete i\*nner quote"       | dsq        | delete inner quote           |
| "delete inner 'que\*te' too" | dsq        | "delete inner quote too"     |

When deleting or changing open/close pairs, the closing character always leaves whitespace intact, while the opening character will try to remove a whitespace character (if it exists).
<br>
In `V` mode:
just `S{char}` do add

When you press the dot `.` key, it repeats the last operation on the current cursor.

***
### Spelling

| Command | Description                         |
| ------- | ----------------------------------- |
| zg      | Add word under Cursor to Dictionray |
| z=      | Provide suggestions                 |
| ]s      | GOTO next misspelled word           |
| \[s     | GOTO prev misspelled word           |
***
### NeoTree
[NeoTree](https://github.com/nvim-neo-tree/neo-tree.nvim)

| Command    | Description      |
| ---------- | ---------------- |
| Ctrl + f   | Open/Focus Left  |
| Ctrl + g   | Open/Focus Right |
| Ctrl + b   | Close            |
| \<leader>s | Open Float       |
***
### NeoGit

| Command     | Decription       |
| ----------- | ---------------- |
| \<leader>ng | Open NeoGit menu |

***
### UFO Folding
[ufo](https://github.com/kevinhwang91/nvim-ufo)

| Command | Description    |
| ------- | -------------- |
| zR      | Open All       |
| zM      | Close All      |
| za      | Toggle Current |
| zi      | Toggle Folding |
***
### copilot

| Command       | Description     |
| ------------- | --------------- |
| \<leader>copd | Copilot Disable |
| \<leader>cope | Copilot Enable  |
| \<leader>copp | Copilot Panel   |
| \<leader>cops | Copilot Status  |
| C - j         | Accept Answer   |
| C - ]         | Dismiss Answer  |
| A - \[        | Show Next       |
| A - ]         | Show Prev       |
| A - Right     | Accept Word     |
| A - S - Right | Accept Line     |
***
### vim-visual-multi
[vim-visual-multi](https://github.com/mg979/vim-visual-multi)

| Command        | Action                               |
| -------------- | ------------------------------------ |
| Ctrl + n       | Add cursor on current char           |
| Ctrl + UP/Down | Add cursors vertically               |
| n / N          | Get next/previous occurrence         |
| q              | Skip current and get next occurrence |
| \[ / ]         | Select next/previous cursor          |
| Q              | Remove current cursor                |
***
### doge doc
[doge doc](https://github.com/kkoomen/vim-doge)

| Command     | Description                  |
| ----------- | ---------------------------- |
| \<leader>p  | Generate Documentation Block |
| \<leader>\[ | GOTO next unwritten Doc      |
| \<leader>\] | GOTO prev unwritten Doc      |
***
### nvim-silicon
Snapshot your code!

| Command     | Description                             |
| ----------- | --------------------------------------- |
| \<leader>ss | Take snapshot for the current selection |
| \<leader>sa | Take snapshot for the entire buffer     |
Note that the previous command are in `V` visual mode.
***
### telescope
[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim#pickers)

| Command     | Description                                   |
| ----------- | --------------------------------------------- |
| \<leader>tt | Telescope Menu                                |
| \<leader>f  | Find files in pwd                             |
| \<leader>d  | Open a recently closed files                  |
| \<leader>aq | Search all over pwd                           |
| \<leader>q  | Search in current buffer                      |
| \<leader>ww | Keymaps CheatSheet and apply command on \<CR> |
| \<leader>mp | Man pages                                     |
| \<leader>vs | LSP Code Navigation in current buffer         |
| \<leader>j  | jumplist                                      |
| \<leader>tg | git Menu                                      |

***
### telescope and git
[telescope.nvim - git Pickers](https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#git-pickers)

Press `<leader>gt` to open the git menu, here are the key binding of the menu:

| Function     | Key      | Description                                                        |
| ------------ | -------- | ------------------------------------------------------------------ |
| git_commits  | \<CR\>   | Lists git commits with diff preview                                |
|              | \<C-r\>h | Reset hard                                                         |
| git_bcommits | \<CR\>   | Lists git commits for the current buffer                           |
|              | \<C-v>   | Preview in Vertical                                                |
|              | \<C-x>   | Preview in Horizontal                                              |
|              | \<C-t>   | Preview in Tab                                                     |
| git_status   | \<CR>    | Lists current changes per file with diff preview and add action    |
| git_stash    | \<CR>    | Lists stash items in current repository with ability to apply them |
***
### Auto Completion
All of the following keys are in `insert` mode.

| Key        | Description                             | 
| ---------- | --------------------------------------- | 
| \<CR>      | Accept auto completion                  | 
| \<C-Space> | Show completion menu                    | 
| \<C-e>     | Abort from completion menu              | 
| \<C-f>     | Move and select the next snippet field  | 
| \<C-b>     | Move and select the prev snippet field  | 
| \<C-u>     | Scroll up in completion documentation   | 
| \<C-d>     | Scroll down in completion documentation | 

The `snippet field` is the parameter of the function, tag, etc.<br>
For example:<br>
```c
strcat(char *, const char *)
```
neovim will auto select the first parameter `char *` and you just type what you want, pressing `C-f` will selects the next the parameter `const char *` and also you just type what you want immediately.<br><br>
Also with `HTML` snippet: `<p class="" id=""></p>`:<br>
Cursor will be at the first `"*"` then pressing `C-f` will moves the cursor to the next `"*"`, again, will moves you to `>*<` inside the element.<br>
The `*` indicates the cursor position.<br>
***
### commentary.vim
[commentary.vim: comment stuff out](https://github.com/tpope/vim-commentary)

| Mode | Command    | Description                                         |
| ---- | ---------- | --------------------------------------------------- |
| n    | gcc        | Un/Comment current line                             |
| v    | gc         | Un/Comment selection or current line                |
| n    | 5gcc       | Un/Comment 5 lines down                             |
| n    | gc{motion} | Un/Comment the {motion} moves over, see example:    |
| n    | gca{       | Un/Comment inside { along with the line with the {} |
| n    | gci{       | Un/Comment inside {                                 |
| n    | gcap       | Un/Comment a paragraph                              |

