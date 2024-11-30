-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5

return {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    opts = {
        filters = {
            dotfiles = true,
            custom = { '.git', '.DS_Store' },
        },
        update_focused_file = {
            enable = true,
            update_root = true,
        },
        renderer = {
            root_folder_label = function(path)
                local project = vim.fn.fnamemodify(path, ":t")
                return string.upper(project)
            end,
            indent_markers = { enable = true },
            icons = {
                git_placement = "after",
                glyphs = {
                    default = "",
                    symlink = "",
                    git = {
                        unstaged = "U",
                        staged = "S",
                        unmerged = "UM",
                        renamed = "R",
                        deleted = "D",
                        untracked = "UT",
                        ignored = "I",
                    },
                },
                show = {
                    file = false,
                    folder = false,
                    folder_arrow = true,
                },
            },
        },
        view = {
            signcolumn = "yes",
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
                    local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
                    return {
                        border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
                        style = "minimal",
                        relative = "editor",
                        row = center_y,
                        col = center_x,
                        width = window_w_int,
                        height = window_h_int,
                    }
                end,
            }
        }
    },
    config = function(_, options)
        -- vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')
        -- vim.keymap.set('n', '<esc>', '<cmd>NvimTreeClose<cr>')
        require("nvim-tree").setup(options)
    end
}
