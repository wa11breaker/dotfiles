-- Nvim-Tree.lua advises to do this at the start.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd('highlight NvimTreeNormal guibg = ##ffffff')

local renderer = {
    root_folder_label = function(path)
        local project = vim.fn.fnamemodify(path, ":t")
        return string.upper(project)
    end,
    indent_width = 2,
    -- indent_markers = {
    --     enable = false,
    --     inline_arrows = true,
    -- },
    highlight_modified = "all",
    highlight_git = true,
    indent_markers = { enable = true },
    icons = {
        git_placement = 'after',
        modified_placement = 'after',
        padding = ' ',
        glyphs = {
            default = "",
            symlink = "",
            bookmark = "",
            git = {
                unstaged = "",
                staged = "",
                unmerged = "",
                renamed = "➜",
                deleted = "",
                untracked = "",
                ignored = "◌",
            },
            folder = {
                arrow_open = "",
                arrow_closed = "",
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
                symlink_open = "",
            },
            -- folder = {
            --     arrow_closed = '',
            --     arrow_open = '',
            --     default = ' ',
            --     open = ' ',
            --     empty = ' ',
            --     empty_open = ' ',
            --     symlink = '󰉒 ',
            --     symlink_open = '󰉒 ',
            -- },
            -- git = {
            --     unstaged = "M",
            --     staged = "A",
            --     unmerged = "UM",
            --     renamed = "R",
            --     untracked = 'U',
            --     deleted = 'D',
            --     ignored = "I",
            -- },
            -- diagnostics = {
            --     enable = true,
            --     show_on_dirs = true,
            --     icons = {
            --         hint = "",
            --         info = "",
            --         warning = "",
            --         error = "",
            --     },
            -- },
        },
    },
}


local HEIGHT_RATIO = 0.8 -- You can change this
local WIDTH_RATIO = 0.5  -- You can change this too

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
    -- width = {
    --     max = 40,
    --     min = 40,
    --     padding = 1
    -- },
    relativenumber = true,
    float = {
        enable = true,
        open_win_config = function()
            local screen_w = vim.opt.columns:get()
            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
            local window_w = screen_w * WIDTH_RATIO
            local window_h = screen_h * HEIGHT_RATIO
            local window_w_int = math.floor(window_w)
            local window_h_int = math.floor(window_h)
            local center_x = (screen_w - window_w) / 2
            local center_y = ((vim.opt.lines:get() - window_h) / 2)
                - vim.opt.cmdheight:get()
            return {
                border = "rounded",
                relative = "editor",
                row = center_y,
                col = center_x,
                width = window_w_int,
                height = window_h_int,
            }
        end,
    },
    width = function()
        return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
    end,
}

-- Setup.
require 'nvim-tree'.setup {
    view = view,
    git = {
        enable = true,
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
