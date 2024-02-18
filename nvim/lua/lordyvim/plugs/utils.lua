-- copies the current file's directory path to the system clipboard
function CopyFileDirectory()
    local file_path = vim.fn.expand('%:p')
    local directory = vim.fn.fnamemodify(file_path, ':h')
    
    vim.fn.setreg('+', "\"" .. directory .. "\"")
    
    print("Directory copied to clipboard: " .. directory)
end

return {
    CopyFileDirectory = CopyFileDirectory
}
