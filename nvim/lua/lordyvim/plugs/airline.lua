local devicon = require('nvim-web-devicons')

-- Airline
vim.g.airline_powerline_fonts = 1

vim.g.airline_section_a = vim.fn["airline#section#create"]({ 'mode', 'crypt', 'paste', 'iminsert' })
vim.g.airline_section_y = '%{""}'
vim.g.airline_section_z = "%{line('.')}/%{line('$')} Col %c"

-- Add the file language icon to the line besides the file language name
vim.api.nvim_create_autocmd({ "BufEnter", "BufLeave" }, {
    callback = function()
        local icon = devicon.get_icon(vim.fn.expand("%:p")) or ""
        local fileNameIcon = ""

        if not (icon == "") then
            fileNameIcon = " " .. icon .. " " .. vim.bo.filetype
        end

        vim.g.airline_section_x = vim.fn["airline#section#create"]({ fileNameIcon })
    end
})

-- Airline symbols
vim.g.airline_left_sep = ''
vim.g.airline_left_alt_sep = ''
vim.g.airline_right_sep = ''
vim.g.airline_right_alt_sep = ''
