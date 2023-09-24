vim.o.background = "dark"
vim.g.gruvbox_material_background = "hard"
-- vim.g.gruvbox_material_transparent_background = 1
vim.cmd.colorscheme 'gruvbox-material'

-- vim.g.everforest_diagnostic_line_highlight = 1
-- vim.cmd[[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]
-- vim.cmd('colorscheme everforest')


vim.fn.sign_define({
    {
        name = 'DiagnosticSignError',
        text = '',
        texthl = 'DiagnosticSignError',
        linehl = 'ErrorLine',
    },
    {
        name = 'DiagnosticSignWarn',
        text = '',
        texthl = 'DiagnosticSignWarn',
        linehl = 'WarningLine',
    },
    {
        name = 'DiagnosticSignInfo',
        text = '',
        texthl = 'DiagnosticSignInfo',
        linehl = 'InfoLine',
    },
    {
        name = 'DiagnosticSignHint',
        text = '',
        texthl = 'DiagnosticSignHint',
        linehl = 'HintLine',
    },
})
