return {
    "nvim-telescope/telescope.nvim",
    version = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
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

        telescope.load_extension("ui-select")
        telescope.load_extension("fzf")

        vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
        vim.keymap.set('n', '<leader>sF', require('telescope.builtin').git_files, { desc = '[S]earch [F]iles' })
        vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
        vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
        vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
        vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[S]earch by [G]rep' })
    end
}
