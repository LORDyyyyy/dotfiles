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

-- A helper function used in SearchGoogle to encode the selected text into a URL
local function url_encode(str)
    if (str) then
        str = string.gsub(str, "([^%w%-%.%_%~])",
            function (c) return string.format ("%%%02X", string.byte(c)) end)
    end
    return str
end

-- A helper function to retrieve the selected text in visual mode
local function get_visual_selection()
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")
    local start_line = start_pos[2]
    local start_col = start_pos[3]
    local end_line = end_pos[2]
    local end_col = end_pos[3]

    if start_line == end_line then
        -- Single line selection
        local line = vim.fn.getline(start_line)
        return string.sub(line, start_col, end_col)
    else
        -- Multi-line selection
        local lines = vim.fn.getline(start_line, end_line)
        lines[1] = string.sub(lines[1], start_col, -1)
        lines[#lines] = string.sub(lines[#lines], 1, end_col)
        return table.concat(lines, " ")
    end
end

-- Function to search Google for the selected text
local function SearchGoogle()
    local selected_text = get_visual_selection()

    local encoded_text = url_encode(selected_text)

    local search_url = "https://www.google.com/search?q=" .. encoded_text

    -- Open the search URL in the default browser
    os.execute("xdg-open " .. search_url)
end



return {
    CopyFileDirectory = CopyFileDirectory,
    CopyTrimmedLine = CopyTrimmedLine,
    ReadAndPasteFile = PSFileInit,
    SearchGoogle = SearchGoogle
}
