require("toggleterm").setup({
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.32
        end
    end,
    float_opts = {
        border = 'curved',
        width = 120,
    },
})
