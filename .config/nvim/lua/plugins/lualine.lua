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
    symbols = { error = "E ", warn = "W ", hint = "H ", info = "I " },
}

local encoding = {
    'encoding',
    fmt = function(str) return string.upper(str) end,
    padding = { left = 1, right = 1 },
    separator = { left = "" },
}

local location = {
    'location',
}

local function window()
    return vim.api.nvim_win_get_number(0)
end

return {
    'nvim-lualine/lualine.nvim',
    opts =
    {
        options = {
            icons_enabled = true,
            component_separators = { " ", " " },
            section_separators = { left = " ", right = " " },
            always_divide_middle = true,
            disabled_filetypes = { 'nvim-tree' },
            globalstatus = false,
        },

        sections = {
            lualine_a = { mode },
            lualine_b = { "branch", diagnostics },
            lualine_c = { filename },
            lualine_x = { 'searchcount' },
            lualine_z = { location }
        },

        inactive_sections = {
            lualine_a = { window },
            lualine_b = {
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
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        extensions = { 'man', 'nvim-dap-ui', 'toggleterm', 'nvim-tree' }
    }
}
