return {
    "nvim-telescope/telescope.nvim",
    version = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
            return vim.fn.executable "make" == 1
        end,
    },
    config = function()
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
                ["ui-select"] = {
                    layout_config = { width = 0.4, height = 0.4 },
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
                    "build/",
                    "coverage/",
                },
            },
        })

        -- telescope.load_extension("fzf")
        telescope.load_extension("ui-select")

        vim.keymap.set('n', '<leader>sf', require('telescope.builtin').git_files, { desc = '[S]earch [F]iles' })
        vim.keymap.set('n', '<leader>sF', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
        vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
        vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
        vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
        vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[S]earch by [G]rep' })
    end
}
