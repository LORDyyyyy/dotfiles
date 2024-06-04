require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "javascript", "c", "typescript",
        "lua", "vim", "python",
        "css", "java", "rust",
        "html", "ruby", "bash",
        "cpp", "go", "json",
        "php", "puppet", "regex",
        "sql", "php", "latex"
    },

    sync_install = true,

    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
}
