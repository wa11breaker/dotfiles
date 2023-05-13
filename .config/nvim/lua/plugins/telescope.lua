local ts = require 'telescope'
local actions = require("telescope.actions")

-- Setup.
ts.setup({
    defaults = {
        sort_mru = true,
        sorting_strategy = 'ascending',
        layout_config = {
            prompt_position = 'top',
            preview_width = 0.4,
        },
        border = true,
        -- borderchars = {
        -- 	prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
        -- 	results = { " " },
        -- 	preview = { " " },
        -- },
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
            },
        },
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {}

        }
    }
})

require("telescope").load_extension("ui-select")
