local config = require('gitsigns')

config.setup {
    signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "▎" },
        topdelete = { text = "▎" },
        changedelete = { text = "▎" },
    },
    current_line_blame = true,
    current_line_blame_opts = {
        delay = 1000,
    }
}

