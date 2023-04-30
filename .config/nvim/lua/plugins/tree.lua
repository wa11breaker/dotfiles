-- -- disable netrw at the very start of your init.lua (strongly advised)
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
--
-- require("nvim-tree").setup({
-- 	update_focused_file = {
-- 		enable = true,
-- 		update_cwd = true,
-- 	},
-- 	hijack_directories = {
-- 		enable = true,
-- 		auto_open = false,
-- 	},
-- 	disable_netrw = false,
-- 	hijack_netrw = false,
-- 	renderer = {
-- 		root_folder_label = function(path)
-- 			local project = vim.fn.fnamemodify(path, ":t")
-- 			return string.upper(project)
-- 		end,
-- 	}
-- })
--
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
        icons = {
            corner = '╰'
        }
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
                deleted = '',
                unstaged = '',
                untracked = '',
                staged = '',
                unmerged = '',
            }
        }
    }
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
