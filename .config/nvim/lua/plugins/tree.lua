-- Nvim-Tree.lua advises to do this at the start.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


local renderer = {
    root_folder_label = function(path)
        local project = vim.fn.fnamemodify(path, ":t")
        return string.upper(project)
    end,
    indent_width = 2,
    indent_markers = {
        enable = true,
        inline_arrows = true,
        -- icons = {
        --     corner = '╰'
        -- }
    },
    icons = {
        git_placement = 'after',
        modified_placement = 'after',
        padding = ' ',
        glyphs = {
            folder = {
                arrow_closed = '',
                arrow_open = '',
                default = ' ',
                open = ' ',
                empty = ' ',
                empty_open = ' ',
                symlink = '󰉒 ',
                symlink_open = '󰉒 ',
            },
            git = {
                unstaged = "M",
                staged = "A",
                unmerged = "UM",
                renamed = "R",
                untracked = 'U',
                deleted = 'D',
                ignored = "I",
            },
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
}

local view = {
    cursorline = false,
    hide_root_folder = false,
    signcolumn = 'no',
    mappings = {
        list = {
            -- Allow moving out of the explorer.
            { key = "<C-i>", action = "toggle_file_info" },
            { key = "<C-k>", action = "" },
            { key = "[",     action = "dir_up" },
            { key = "]",     action = "cd" },
            { key = "<Tab>", action = "edit" }
        }
    },
    width = {
        max = 40,
        min = 40,
        padding = 1
    },
}

-- Setup.
require 'nvim-tree'.setup {
    hijack_cursor = true,
    sync_root_with_cwd = true,
    view = view,
    git = {
        ignore = false
    },
    renderer = renderer,
    diagnostics = {
        enable = true
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },

}
