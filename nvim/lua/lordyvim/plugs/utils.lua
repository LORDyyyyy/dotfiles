-- copies the current file's directory path to the system clipboard
function CopyFileDirectory()
    local file_path = vim.fn.expand('%:p')
    local directory = vim.fn.fnamemodify(file_path, ':h')

    vim.fn.setreg('+', "\"" .. directory .. "\"")

    print("Directory copied to clipboard: " .. directory)
end

function CopyTrimmedLine()
    local cursor_position = vim.fn.getpos('.')
    local line = vim.fn.getline('.')

    line = line:gsub("^%s*(.-)%s*$", "%1")

    vim.fn.setreg('+', line)
    vim.fn.setpos('.', cursor_position)
end

return {
    CopyFileDirectory = CopyFileDirectory,
    CopyTrimmedLine = CopyTrimmedLine
}
