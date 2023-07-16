local mode = {
    'mode',
    fmt = function(str) return str:sub(1, 1) end
}

local filename = {
    'filename',
    show_filename_only = false,
    padding = 1,
    path = 1,
    symbols = { modified = '*', readonly = ' ', unnamed = '' }
}

local diagnostics = {
    'diagnostics',
    update_in_insert = true,
    symbols = { error = " ", warn = " ", hint = " ", info = " " },
}

local encoding = {
    'encoding',
    fmt = function(str) return string.upper(str) end,
    padding = { left = 1, right = 1 },
    separator = { left = "" },
}

local progress = {
    '%P',
    icon = "",
    padding = { left = 0, right = 1 },
}

local filename_inactive = {
    'filename',
    padding = 1,
    path = 0,
    symbols = { modified = ' ', readonly = ' ', unnamed = '' }
}

local location = {
    'location',

}

local filetype = {
    'filetype',
    separator = { left = "" },
}

local branch = {
    'branch',
    separator = { right = "" },
}

local function window()
    return vim.api.nvim_win_get_number(0)
end

local auto_theme_custom = require('lualine.themes.auto')
auto_theme_custom.normal.c.bg = 'none'

--- Setup ---
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = auto_theme_custom,
        -- section_separators = { left = '', right = '' }, --  
        component_separators = { " ", " " },
        section_separators = { left = "", right = "" },
        always_divide_middle = true,
        disabled_filetypes = { 'nvim-tree' },
        globalstatus = false,
    },

    sections = {
        lualine_a = { mode },
        lualine_b = { branch, },
        lualine_c = { filename, diagnostics },
        lualine_x = { encoding },
        lualine_y = { filetype, 'searchcount', progress },
        lualine_z = { location }
    },

    inactive_sections = {
        lualine_a = { window },
        lualine_b = {},
        lualine_c = {
            function()
                return "%="
            end,
            {
                "filename",
                path = 1,
                shorting_target = 40,
                symbols = {
                    modified = "*",
                    unnamed = "[No Name]",
                    newfile = "[New]",
                },
            },
        },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = { 'man', 'nvim-dap-ui', 'toggleterm', 'nvim-tree' }
}
