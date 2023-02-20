local builtin = require('telescope.builtin')
local map = vim.keymap.set

map('n', '<leader>sf', builtin.find_files, {})
map('n', '<leader>sw', builtin.live_grep, {})
map('n', "<leader>dl", "<cmd>Telescope diagnostics<cr>", {})

map('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
map('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
map('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
map('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
map('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

local function telescope_buffer_dir()
    return vim.fn.expand('%:p:h')
end

vim.keymap.set("n", "sf", function()
    require('telescope').extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = false,
        initial_mode = "normal",
        layout_config = { height = 40 }
    })
end)

local actions = require('telescope.actions')
require('nvim-web-devicons').setup({
    override = {},
    default = true
})
require('telescope').setup {
    defaults = {
        winblend = 0,
        border = {},
        file_ignore_patterns = { '.git/', 'node_modules', 'build' },
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        path_display = { 'smart' },
        selection_strategy = 'reset',
        sorting_strategy = 'ascending',
        layout_strategy = 'horizontal',
        layout_config = {
            horizontal = {
                prompt_position = 'top',
                preview_width = 0.5,
                results_width = 0.8,
            },
            vertical = {
                mirror = true,
            },
            width = 0.65,
            height = 0.80,
            preview_cutoff = 120,
        },
        mappings = {
            i = {
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,
                ['<tab>'] = actions.select_default,
                ['<esc>'] = actions.close,
            }
        }
    },
    layout_config = {
        horizontal = {
            preview_cutoff = 100,
            preview_width = 0.6
        }
    }
}
