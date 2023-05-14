local ts = require 'telescope'
local actions = require("telescope.actions")

-- Setup.
ts.setup({
    defaults = {
        sort_mru = true,
        sorting_strategy = 'ascending',
        border = true,
        multi_icon = '',
        entry_prefix = '   ',
        prompt_prefix = '   ',
        selection_caret = '  ',
        hl_result_eol = true,
        results_title = "",
        winblend = 0,
        wrap_results = true,
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ['<C-p>'] = require('telescope.actions.layout').toggle_preview
            },
        },
        preview = {
            hide_on_startup = true -- hide previewer when picker starts
        },
        layout_config = {
            horizontal = { width = 0.6 },
            prompt_position = 'top',
        },
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {}

        }
    }
})

require("telescope").load_extension("ui-select")
