local ts = require 'telescope'
local actions = require("telescope.actions")

-- Setup.
ts.setup({
    defaults = {
        -- sort_mru = true,
        -- sorting_strategy = 'ascending',
        -- border = true,
        -- multi_icon = '',
        -- entry_prefix = '   ',
        -- prompt_prefix = '   ',
        -- selection_caret = '  ',
        -- hl_result_eol = true,
        -- results_title = "",
        -- winblend = 0,
        -- wrap_results = true,
        file_ignore_patterns = {
            "build/", "node_modules/"
        },
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ['<C-p>'] = require('telescope.actions.layout').toggle_preview
            },
        },
        -- preview = {
        --     hide_on_startup = true -- hide previewer when picker starts
        -- },
        pickers = {
            colorscheme = {
                enable_preview = true
            }
        },
        -- layout_config = {
        --     horizontal = { width = 0.6 },
        --     prompt_position = 'top',
        -- },
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {}

        },
        ["media_files"] = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = { "png", "webp", "jpg", "jpeg" },
            -- find command (defaults to `fd`)
            find_cmd = "rg"
        }
    }
})

pcall(require('telescope').load_extension, 'fzf')
require("telescope").load_extension("ui-select")
require("telescope").load_extension("media_files")
