local config = require "gitsigns"

config.setup {
    signs = {
        add = { text = '▕' },
        change = { text = '▕' },
        delete = { text = '▕' },
        topdelete = { text = '‾' },
        changedelete = { text = '▕' },
        untracked = { text = '▕' },
    },
    current_line_blame = false,
    current_line_blame_opts = {
        delay = 1000,
    },
}
