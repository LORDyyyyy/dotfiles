local home = os.getenv("HOME")
local getBuffferIcon = function()
    return require('nvim-web-devicons').get_icon(vim.fn.expand("%:p")) .. " " or ""
end

require("silicon").setup({

    -- the font settings with size and fallback font
    font = "RobotoMono Nerd Font =22;Noto Color Emoji",

    -- the theme to use, depends on themes available to silicon
    theme = "Dracula",

    pad_horiz = 75,
    pad_vert = 60,

    -- the distance between lines of code
    line_pad = 5,

    -- the background color outside the rendered os window
    -- (in hexcode string e.g "#076678")
    background = nil,

    -- with which language the syntax highlighting shall be done, should be
    -- a function that returns either a language name or an extension like "js"
    language = function()
        return vim.bo.filetype
    end,

    -- whether to put the image onto the clipboard, may produce an error,
    -- if run on WSL2
    to_clipboard = true,

    -- a string or function returning a string that defines the title
    -- showing in the image, only works in silicon versions greater than v0.5.1
    -- here a function is used to get the name of the current buffer
    window_title = function()
        return " LORDyyyyy - " .. getBuffferIcon() .. vim.fn.fnamemodify(
            vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()),
            ":t"
        )
    end,

    -- a string or function that defines the path to the output image
    -- there will be no output if to_clipboard option = true
    output = function()
        return home .. "/Pictures/Code/" .. os.date("!%Y-%m-%dT%H-%M-%S") .. "." .. vim.bo.filetype .. ".code.png"
    end,
})
