vim.g.copilot_no_tab_map = true -- disable the <Tab> keymap
vim.g.copilot_assume_mapped = true
vim.g.copilot_enabled = false -- disable auto start


require("CopilotChat").setup {
    debug = true, -- Enable debugging
    window = {
        layout = 'float',
        border = 'rounded',
        width = 0.7,
        height = 0.7
    }
}
