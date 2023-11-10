-- 'default', 'atlantis', 'andromeda', 'shusia', 'maia', 'espresso'
vim.g.sonokai_style = 'default'
vim.g.sonokai_better_performance = 1
vim.cmd('colorscheme sonokai')

vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("custom_highlights_sonokai", {}),
    pattern = "sonokai",
    callback = function()
        local config = vim.fn["sonokai#get_configuration"]()
        local palette = vim.fn["sonokai#get_palette"](config.style, config.colors_override)
        local set_hl = vim.fn["sonokai#highlight"]

        set_hl("NormalFloat", palette.fg, palette.bg_dim)
        set_hl("FloatBorder", palette.fg, palette.bg_dim)

        -- set_hl("ErrorFloat", palette.red, palette.bg_dim)
        -- set_hl("WarningFloat", palette.yellow, palette.bg_dim)
        -- set_hl("InfoFloat", palette.blue, palette.bg_dim)
        -- set_hl("HintFloat", palette.green, palette.bg_dim)
    end
})

