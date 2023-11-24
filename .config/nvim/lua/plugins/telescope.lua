local telescope = require("telescope")
local actions = require("telescope.actions")
telescope.setup({
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case" or "smart_case"
        },
    },
    defaults = {
        border = {},
        borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ['<C-p>'] = require('telescope.actions.layout').toggle_preview
            },
        },
        file_ignore_patterns = {
            ".git/",
            "node_modules/",
            "package/",
            "build/",
            "coverage/",
        },
    },
    pickers = {
        -- find_files = {
        --     hidden = true,
        --     disable_devicons = true,
        --     -- Hide "./" sign on search result
        --     find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
        -- },
        -- buffers = {
        --     sort_lastused = true,
        --     sorter = require("telescope.sorters").get_substr_matcher(),
        -- },
    },
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")
