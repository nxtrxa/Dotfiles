return {
    "jakemason/ouroboros.nvim",
    version = "*",
    config = function ()
        require('ouroboros').setup({
            extension_preferences_table = {
                c = {h = 2, hpp = 1},
                h = {c = 2, cpp = 1},
                cpp = {hpp = 2, h = 1},
                hpp = {cpp = 1, c = 2},
            },
            switch_to_open_pane_if_possible = false,
        })
    end
}
