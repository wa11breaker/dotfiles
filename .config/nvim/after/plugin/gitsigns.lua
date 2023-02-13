-- gitsigns
local config = require('gitsigns')

config.setup {
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
    },
    current_line_blame = true,
    current_line_blame_opts = {
        delay = 1000,
    }
}
