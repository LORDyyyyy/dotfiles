require("oil").setup({
    default_file_explorer = false, -- neotree is the default
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    view_options = {
        show_hidden = true,
        natural_order = true,
        is_always_hidden = function(name, _)
            return name == '..' or name == '.git'
        end,
    },
    win_options = {
        wrap = true,
    }
})
