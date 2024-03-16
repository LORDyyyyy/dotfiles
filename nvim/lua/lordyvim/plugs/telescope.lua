require('telescope').setup({
    pickers = {
        current_buffer_fuzzy_find = { sorting_strategy = 'ascending' },
    },
})

-- This is your opts table
require("telescope").setup {
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                -- even more opts
            }
        }
    }
}

-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")
require("telescope").load_extension("remote-sshfs")
