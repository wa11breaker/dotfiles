--- Elements customization ---

local mode = {
    'mode',
    fmt = function(str) return str:sub(1, 1) end
}

local filename = {
    'filename',
    padding = 1,
    path = 0,
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

--- Setup ---
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' }, --  
        always_divide_middle = true,
        disabled_filetypes = {
            "NvimTree",
            "TelescopePrompt",
            "packer",
            "toggleterm",
        },
        globalstatus = true,
    },

    sections = {
        lualine_a = { mode },
        lualine_b = { branch },
        lualine_c = { filename },
        lualine_x = { diagnostics, encoding },
        lualine_y = { filetype, 'searchcount', progress },
        lualine_z = { location }
    },

    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { filename_inactive, },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = { 'man', 'nvim-dap-ui', 'toggleterm', 'nvim-tree' }
}
