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

-- Read file and paste its content
-- Open a specific file, it's file path is defined in the function,
-- and paste the file's content in the current opened buffer
function PSFileInit()
    local file_path = "/home/lordy/Templates/PS/problem_solving.cpp"

    local file = io.open(file_path, "r")
    if not file then
        print("Could not open file: " .. file_path)
        return
    end

    local content = file:read("*a")
    file:close()

    local buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(content, "\n"))
    -- see https://neovim.io/doc/user/api.html#nvim_buf_set_lines()
end

return {
    CopyFileDirectory = CopyFileDirectory,
    CopyTrimmedLine = CopyTrimmedLine,
    ReadAndPasteFile = ReadAndPasteFile
}
