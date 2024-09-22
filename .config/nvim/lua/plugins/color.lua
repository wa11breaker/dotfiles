return {
    "sainnhe/sonokai",
    enabled = true,
    priority = 1000,
    config = function()
        -- 'default', 'atlantis', 'andromeda', 'shusia', 'maia', 'espresso'
        vim.g.sonokai_style = 'default'
        vim.g.sonokai_better_performance = 1
        vim.cmd('colorscheme sonokai')

        vim.cmd("highlight NormalFloat guibg=NONE ctermbg=NONE")
        vim.cmd("highlight FloatBorder guibg=NONE ctermbg=NONE")
        vim.cmd("highlight NvimTreeNormal guibg=NONE ctermbg=NONE")
        vim.cmd("let g:sonokai_transparent_background = 1")
    end
}
